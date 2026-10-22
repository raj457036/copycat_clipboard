import 'dart:async';

import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/constants/strings/strings.dart';
import 'package:clipboard/base/data/services/clipboard_service.dart';
import 'package:clipboard/base/domain/model/application_meta/activity_meta_payload.dart';
import 'package:clipboard/base/domain/model/app_config/appconfig.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/repositories/clipboard.dart';
import 'package:clipboard/base/domain/services/application_meta_resolver.dart';
import 'package:clipboard/base/domain/services/cross_sync_listener.dart';
import 'package:clipboard/base/data/services/clipboard/clip_hash_registry.dart';
import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:clipboard/base/data/services/lan_sync_service.dart';
import 'package:clipboard/base/domain/model/exclusion_rules/exclusion_result.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/utils/clipboard_feedback_service.dart';
import 'package:clipboard/base/bloc/user_devices_cubit/user_devices_cubit.dart';
import 'package:clipboard/base/domain/services/sync_event_bus.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/enums/platform_os.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/routes/routes.dart' show rootNavigationKey;
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:focus_window/platform/activity_info.dart';
import 'package:share_plus/share_plus.dart';
import "package:universal_io/io.dart";

part 'offline_persistance_cubit.freezed.dart';
part 'offline_persistance_state.dart';
part 'offline_persistance_feedback_mixin.dart';

@lazySingleton
class OfflinePersistenceCubit extends Cubit<OfflinePersistanceState>
    with OfflinePersistenceFeedbackMixin {
  final AuthCubit auth;
  final ClipboardRepository repo;
  final ClipboardService clipboard;
  @override
  final AppConfigCubit appConfig;
  @override
  final UserDevicesCubit userDevicesCubit;
  final ApplicationMetaResolver appMetaResolver;
  final String deviceId;
  final SyncEventBus syncEventBus;
  final StreamController<ClipboardItem> _newClipboardItem =
      StreamController<ClipboardItem>.broadcast();

  bool _listening = false;

  StreamSubscription<List<ClipItem?>>? copySub;
  StreamSubscription<SyncEvent>? _remoteSyncSub;

  OfflinePersistenceCubit(
    this.auth,
    @Named("local") this.repo,
    this.clipboard,
    this.appConfig,
    this.userDevicesCubit,
    this.appMetaResolver,
    @Named("device_id") this.deviceId,
    this.syncEventBus,
  ) : super(const OfflinePersistanceState.initial());

  Stream<ClipboardItem> get newClipboardItemStream => _newClipboardItem.stream;

  void clearTransientState() {
    if (state is OfflinePersistanceInitial) return;
    emit(const OfflinePersistanceState.initial());
  }

  ActivityMetaPayload? _toActivityMetaPayload(ActivityInfo? activity) {
    if (activity == null) return null;
    return ActivityMetaPayload(
      identifier: activity.identifier,
      appName: activity.app,
      appFilePath: activity.appFilePath,
      os: currentPlatformOS(),
    );
  }

  Future<ClipboardItem?> getItem({
    required int id,
    bool decrypted = false,
  }) async {
    final result = await repo.get(id: id);
    final item = result.fold(
      (l) {
        logger.e(l);
        return null;
      },
      (r) {
        return r;
      },
    );

    if (decrypted) return item?.decrypt();
    return item;
  }

  Future<void> onCaptureClipboard() async {
    emit(const OfflinePersistanceState.initial());
    if (appConfig.isCopyingPaused) {
      logger.i("Copying is paused!");
      emit(
        const OfflinePersistanceState.error(
          Failure(message: "Copying is paused!", code: "copy-paused"),
        ),
      );
      return;
    }
    final activityCheck = await appConfig.checkActivityExclusion();
    if (!activityCheck.isAllowed) {
      await showExclusionFeedback(activityCheck);
      return;
    }
    await clipboard.readClipboard();
  }

  Future<void> startListeners() async {
    if (_listening) return;
    // Always sync capture mode from current config before listening.
    // This guarantees rich data capture follows the toggle from app startup.
    clipboard.setRichDataEnabled(appConfig.state.config.richDataCapture);
    clipboard.start(onCaptureClipboard);
    copySub = clipboard.onCopy?.listen(onClips);
    _remoteSyncSub = syncEventBus.where<ClipboardItem>().listen((event) {
      if (event is TypedSyncEvent<ClipboardItem>) {
        _onRemoteClipEvent(event.event);
      } else if (event is TypedSyncBatchEvent<ClipboardItem> &&
          event.events.length == 1) {
        _onRemoteClipEvent(event.events.first);
      }
    });
    _listening = true;
  }

  Future<void> paste([String? content]) async {
    if (content == null) {
      final clips = await clipboard.readClipboard(manual: true);
      if (clips != null) {
        await onClips(clips, manualPaste: true);
      }
    } else if (content.isNotEmpty) {
      final clip = ClipItem.text(text: content);
      await onClips([clip], manualPaste: true);
    }
  }

  Future<bool> shareClipboardItem(
    BuildContext context,
    ClipboardItem item,
  ) async {
    return shareClipboardItems(context, [item]);
  }

  Future<bool> shareClipboardItems(
    BuildContext context,
    List<ClipboardItem> items,
  ) async {
    if (items.isEmpty) return false;

    final box = context.findRenderObject() as RenderBox?;
    final origin = box != null
        ? box.localToGlobal(Offset.zero) & box.size
        : null;

    final shareableItems = items.where((item) => item.inCache).toList();
    if (shareableItems.isEmpty) return false;

    final fileItems = <XFile>[];
    final textPayload = <String>[];

    for (final item in shareableItems) {
      switch (item.type) {
        case ClipItemType.text:
          final text = item.text?.trim();
          if (text != null && text.isNotEmpty) {
            textPayload.add(text);
          }
        case ClipItemType.url:
          final url = item.url?.trim();
          if (url != null && url.isNotEmpty) {
            textPayload.add(url);
          }
        case ClipItemType.media:
        case ClipItemType.file:
          final path = item.localPath;
          if (path != null && path.isNotEmpty) {
            fileItems.add(XFile(path));
          }
      }
    }

    final text = textPayload.join("\n\n");
    final firstItem = shareableItems.first;

    if (fileItems.isNotEmpty) {
      await SharePlus.instance.share(
        ShareParams(
          files: fileItems,
          subject: firstItem.title,
          text: text.isEmpty ? firstItem.description : text,
          sharePositionOrigin: origin,
        ),
      );
    } else if (text.isNotEmpty) {
      await SharePlus.instance.share(
        ShareParams(
          text: text,
          subject: firstItem.title,
          sharePositionOrigin: origin,
        ),
      );
    } else {
      return false;
    }

    return true;
  }

  /// Replaces any preview-only items with their fully-loaded counterparts so
  /// that truncated text or stripped rich data is never written to the system
  /// clipboard.
  Future<List<ClipboardItem>> _resolvePreviewItems(
    List<ClipboardItem> items,
  ) async {
    if (items.every((e) => !e.previewOnly)) return items;
    return Future.wait(
      items.map((item) async {
        if (!item.previewOnly || item.id == null) return item;
        return (await getItem(id: item.id!)) ?? item;
      }),
    );
  }

  Future<bool> copyToClipboard(
    List<ClipboardItem> items, {
    bool saveFile = false,
    TextPasteFormat textPasteFormat = TextPasteFormat.auto,
  }) async {
    items = await _resolvePreviewItems(items);
    final copy = CopyToClipboard();

    bool saveFileSuccess = true;
    for (final item in items) {
      switch (item.type) {
        case ClipItemType.text:
          await copy.writeRichText(
            clipboard,
            text: item.text ?? "",
            richData: item.richData,
            mode: textPasteFormat,
          );
        case ClipItemType.url:
          copy.writeUrl(Uri.tryParse(item.url ?? ""));
        case ClipItemType.media:
        case ClipItemType.file:
          if (item.localPath == null) return false;
          if (saveFile) {
            final saved = await copy.saveFile(
              File(item.localPath!),
              fileName: item.fileName,
              fileExtension: item.fileExtension,
              mimeType: item.fileMimeType,
            );
            if (!saved) saveFileSuccess = false;
          } else {
            final written = await copy.writeFileContent(
              File(item.localPath!),
              mimeType: item.fileMimeType,
              fileName: item.fileName,
            );
            if (!written) return false;
          }
      }
    }

    if (saveFile) {
      return saveFileSuccess;
    }

    final copied = await copy.commit(clipboard);

    if (copied) {
      persist(
        items
            .skipWhile((item) => item.id == null)
            .map(
              (item) => item.copyWith(
                copiedCount: item.copiedCount + 1,
                lastCopied: systemTime(),
              ),
            )
            .toList(),
        updatedFields: ["copiedCount"],
      );
    }

    return copied;
  }

  Future<ClipboardItem> _convertToClipboardItem(
    ClipItem clip, {
    ActivityInfo? activity,
    String? sourceId,
  }) async {
    final userId = auth.userId;
    final sourceApp = (activity?.app ?? "").trim().isEmpty
        ? null
        : activity!.app;
    final sourceUrl = sanitizeSourceUrl(activity?.url);

    switch (clip.type) {
      case ClipItemType.text:
        return ClipboardItem.fromText(
          clip.text!,
          userId: userId,
          category: clip.textCategory,
          sourceApp: sourceApp,
          sourceUrl: sourceUrl,
          sourceId: sourceId,
          richData: clip.richData,
        );
      case ClipItemType.media:
        {
          final path = clip.file!.path;
          return ClipboardItem.fromMedia(
            path,
            userId: userId,
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize: clip.fileSize,
            blurHash: clip.blurHash,
            sourceApp: sourceApp,
            sourceUrl: sourceUrl ?? clip.uri?.toString(),
            sourceId: sourceId,
          );
        }
      case ClipItemType.file:
        {
          final path = clip.file!.path;

          return ClipboardItem.fromFile(
            path,
            userId: userId,
            preview: clip.text?.sub(end: 256),
            fileName: clip.fileName,
            fileMimeType: clip.fileMimeType,
            fileExtension: clip.fileExtension,
            fileSize: clip.fileSize,
            sourceApp: sourceApp,
            sourceUrl: sourceUrl ?? clip.uri?.toString(),
            sourceId: sourceId,
          );
        }
      case ClipItemType.url:
        return ClipboardItem.fromURL(
          clip.uri!,
          userId: userId,
          sourceApp: sourceApp,
          sourceUrl: sourceUrl,
          sourceId: sourceId,
        );
    }
  }

  Future<void> onClips(
    List<ClipItem?> clips, {
    bool manualPaste = false,
  }) async {
    if (clips.isEmpty) return;

    final activity = appConfig.lastActivity;
    final sourceId = await appMetaResolver.syncFromActivity(
      _toActivityMetaPayload(activity),
    );

    for (final clip in clips) {
      if (clip == null) continue;

      if (exclusionChecker != null) {
        final result = exclusionChecker!.checkClip(
          ExclusionCheckParams(clip: clip, activity: activity),
        );
        if (!result.isAllowed) {
          await showExclusionFeedback(result);
          continue;
        }
      }

      if (!manualPaste &&
          clip.fileSize != null &&
          !appConfig.canCopyFile(clip.fileSize!)) {
        unawaited(clip.cleanup());

        emit(
          const OfflinePersistanceState.error(
            Failure(
              message: "Auto copy is disabled for files over the limit",
              code: "auto-copy-restrictions",
            ),
          ),
        );
        return;
      }

      if (clip.isDuplicate) {
        if (!ClipHashRegistry.instance.consumeFeedbackSuppression(
          clip.contentHash,
        )) {
          await showCopyFeedback();
        }
        continue;
      }

      if (!manualPaste) {
        ClipHashRegistry.instance.register(clip.contentHash);
      }

      final item = await _convertToClipboardItem(
        clip,
        activity: activity,
        sourceId: sourceId,
      );

      if (manualPaste) {
        final userItem = item.copyWith(userIntent: manualPaste);
        await persist([userItem]);
        continue;
      }
      _newClipboardItem.add(item);
      await showCopyFeedback();
      await persist([item]);
    }
  }

  /// stateless = true will not persist the change in the local database, only emit the new state. ( only work with updates )
  Future<void> persist(
    List<ClipboardItem> items, {
    bool synced = false,
    List<String>? updatedFields,
    bool stateless = false,
  }) async {
    final persited = items
        .where((item) => item.isPersisted)
        .map(
          (item) => item.copyWith(
            deviceId: deviceId,
            userId: auth.userId ?? kLocalUserId,
          ),
        )
        .toList();
    final nonPersisted = items
        .where((item) => !item.isPersisted)
        .map(
          (item) => item.copyWith(
            deviceId: deviceId,
            userId: auth.userId ?? kLocalUserId,
          ),
        )
        .toList();

    if (nonPersisted.isNotEmpty) {
      final results = await Future.wait(
        nonPersisted.map((item) => repo.create(item)),
      );

      for (var result in results) {
        result.fold(
          (l) {
            ClipHashRegistry.instance.clear(); // allow retry on failure
            emit(OfflinePersistanceState.error(l));
          },
          (r) {
            syncEventBus.emit<ClipboardItem>((
              synced ? CrossSyncEventType.update : CrossSyncEventType.create,
              r,
            ));
            _broadcastLan(r, synced: synced, updatedFields: updatedFields);
            emit(
              OfflinePersistanceState.saved(
                count: 1,
                created: true,
                synced: synced,
                updatedFields: updatedFields,
              ),
            );
          },
        );
      }
      return;
    }

    // If all items are already persisted, we just need to update the items.
    final updated = await Future.wait(
      persited.map(
        (item) => stateless
            ? Future.value(Right<Failure, ClipboardItem>(item))
            : repo.update(item),
      ),
    );

    for (var result in updated) {
      result.fold((l) => emit(OfflinePersistanceState.error(l)), (r) {
        syncEventBus.emit<ClipboardItem>((CrossSyncEventType.update, r));
        _broadcastLan(r, synced: synced, updatedFields: updatedFields);
        emit(
          OfflinePersistanceState.saved(
            synced: synced,
            updatedFields: updatedFields,
            count: 1,
          ),
        );
      });
    }
  }

  Future<ClipboardItem?> persistLocalLinkPreview(
    ClipboardItem item, {
    String? title,
    String? description,
    String? imageUrl,
  }) async {
    final next = item.copyWith(
      linkPreviewTitle: title,
      linkPreviewDescription: description,
      linkPreviewImageUrl: imageUrl,
    );

    if (next.linkPreviewTitle == item.linkPreviewTitle &&
        next.linkPreviewDescription == item.linkPreviewDescription &&
        next.linkPreviewImageUrl == item.linkPreviewImageUrl) {
      return item;
    }

    final result = await repo.update(next);
    return result.fold(
      (failure) {
        logger.w('Failed to persist local link preview: $failure');
        return null;
      },
      (updated) {
        syncEventBus.emit<ClipboardItem>((CrossSyncEventType.update, updated));
        return updated;
      },
    );
  }

  Future<void> delete(List<ClipboardItem> items) async {
    final items_ = items.map((item) => item.copyWith(deviceId: deviceId));
    await repo.deleteMany(items_.toList());

    if (appConfig.state.config.lanInstantSync) {
      for (final item in items_) {
        final deletedAt = item.deletedAt ?? systemTime();
        final mutation = item.copyWith(
          userId: auth.userId ?? kLocalUserId,
          deletedAt: deletedAt,
          modified: deletedAt,
        );
        _broadcastLan(mutation);
      }
    }

    final deleteEvents = items
        .map<CrossSyncEvent<ClipboardItem>>(
          (item) => (CrossSyncEventType.delete, item),
        )
        .toList();
    if (deleteEvents.length == 1) {
      syncEventBus.emit<ClipboardItem>(deleteEvents.first);
    } else if (deleteEvents.isNotEmpty) {
      syncEventBus.emitBatch<ClipboardItem>(deleteEvents);
    }
  }

  void stopListeners() {
    if (!_listening) return;
    clipboard.dispose();
    copySub?.cancel();
    copySub = null;
    _remoteSyncSub?.cancel();
    _remoteSyncSub = null;
    _listening = false;
  }

  /// Called for every clip event emitted to [syncEventBus].
  /// When [autoWriteOnReceive] is enabled and the clip came from another
  /// device, write it straight to the OS clipboard (desktop only).
  void _onRemoteClipEvent(CrossSyncEvent<ClipboardItem> event) {
    if (Platform.isAndroid || Platform.isIOS) return;

    final (type, item) = event;
    // Only act on newly created remote clips, not local captures or updates.
    if (type != CrossSyncEventType.create) return;
    if (item.deviceId == deviceId) return; // local capture
    if (item.deletedAt != null) return; // ignore deleted clips

    final String? hash = item.contentHash;
    if (ClipHashRegistry.instance.isDuplicate(hash)) return;

    if (appConfig.state.config.autoWriteOnReceive) {
      if (item.encrypted) return; // can't write ciphertext to clipboard
      unawaited(_autoWriteToClipboard(item));
    } else {
      ClipHashRegistry.instance.register(hash, suppressFeedback: false);
      unawaited(showSyncFeedback(item));
    }
  }

  static bool _isLocalMetricOnlyUpdate(List<String>? updatedFields) {
    return updatedFields != null &&
        updatedFields.isNotEmpty &&
        updatedFields.every((f) => f == 'copiedCount' || f == 'lastCopied');
  }

  void _broadcastLan(
    ClipboardItem item, {
    bool synced = false,
    List<String>? updatedFields,
  }) {
    if (synced || !appConfig.state.config.lanInstantSync) return;
    if (_isLocalMetricOnlyUpdate(updatedFields)) return;

    if (Platform.isIOS) return;
    if (Platform.isAndroid) {
      unawaited(
        sl<AndroidBackgroundClipboard>().broadcastClip({
          ...item.toJson(),
          'originId': item.originId ?? '',
          if (item.localPath != null) 'localPath': item.localPath,
        }),
      );
      return;
    }
    unawaited(sl<LanSyncService>().broadcastClip(item));
  }

  Future<void> _autoWriteToClipboard(ClipboardItem item) async {
    try {
      final String? hash = item.contentHash;
      if (ClipHashRegistry.instance.isDuplicate(hash)) return;

      final copy = CopyToClipboard();
      switch (item.type) {
        case ClipItemType.text:
          final String text = item.text ?? '';
          if (text.isEmpty) return;
          await copy.writeRichText(
            clipboard,
            text: text,
            richData: item.richData,
          );
        case ClipItemType.url:
          final String url = item.url ?? '';
          if (url.isEmpty) return;
          copy.writeUrl(Uri.tryParse(url));
        case ClipItemType.media:
        case ClipItemType.file:
          final String? path = item.localPath;
          if (path == null) return;
          final File file = File(path);
          if (!file.existsSync()) return;
          final bool written = await copy.writeFileContent(
            file,
            mimeType: item.fileMimeType,
            fileName: item.fileName,
          );
          if (!written) return;
      }

      final bool committed = await copy.commit(clipboard);
      if (!committed) return;
      ClipHashRegistry.instance.register(hash, suppressFeedback: true);
      logger.i('autoWriteOnReceive: wrote ${item.type} clip to OS clipboard');
      await showSyncFeedback(item);
    } catch (e) {
      logger.e('autoWriteOnReceive: failed to write to OS clipboard: $e');
    }
  }

  @override
  Future<void> close() {
    stopListeners();
    return super.close();
  }
}
