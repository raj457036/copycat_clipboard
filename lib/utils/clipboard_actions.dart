import 'dart:async';

import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/app_lock_cubit/app_lock_cubit.dart';
import 'package:clipboard/base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/base/bloc/file_cloud_cubit/file_cloud_cubit.dart';
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/bloc/review_prompt_cubit/review_prompt_cubit.dart';
import 'package:clipboard/base/bloc/selected_clips_cubit/selected_clips_cubit.dart';
import 'package:clipboard/base/constants/strings/route_constants.dart';
import 'package:clipboard/base/data/services/clipboard_service.dart';
import 'package:clipboard/base/data/services/notification_service.dart';
import 'package:clipboard/base/domain/model/clip_collection/clipcollection.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/domain/model/notification_message.dart'
    show NotificationMessage, NotificationContent;
import 'package:clipboard/base/domain/model/route_payload.dart';
import 'package:clipboard/base/domain/services/cross_sync_listener.dart';
import 'package:clipboard/base/domain/services/sync_event_bus.dart';
import 'package:clipboard/base/domain/sources/clipboard.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/routes/routes.dart' show rootNavigationKey;
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/dialogs/confirm_dialog.dart';
import 'package:clipboard/widgets/window_focus_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:open_filex/open_filex.dart';
import 'package:universal_io/io.dart' show File;
import 'package:url_launcher/url_launcher_string.dart';

Future<bool> isAuthorized(
  Iterable<ClipboardItem> items,
  BuildContext context,
) async {
  final anyItemLocked = items.any((item) => item.locked && item.encrypted);
  if (!anyItemLocked) return true;

  if (!context.mounted) return false;
  final appLockCubit = context.read<AppLockCubit>();

  return await appLockCubit.authorizeForSensitiveAction();
}

Future<void> _maybeShowReviewPrompt() async {
  final context = rootNavigationKey.currentContext;
  if (context == null) return;
  try {
    final reviewPromptCubit = context.read<ReviewPromptCubit>();
    await reviewPromptCubit.trackCopyPasteSuccess();
  } catch (e) {
    logger.e("Error tracking copy/paste success for review prompt: $e");
  }
}

Future<void> moveToPasteStack(
  BuildContext context,
  Iterable<ClipboardItem> items,
) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return;

  final decryptedItems = await Future.wait(items.map((item) => item.decrypt()));

  if (!context.mounted) return;
  await context.pushNamed(
    RouteConstants.pasteStack,
    extra: RoutePayload(data: decryptedItems),
  );
}

/// Write multiple clips to clipboard.
Future<void> multiCopyToClipboard(
  BuildContext context,
  List<ClipboardItem> items,
) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return;

  if (!context.mounted) return;
  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  try {
    final cubit = ctx.read<OfflinePersistenceCubit>();
    final result = await cubit.copyToClipboard(items);
    if (!ctx.mounted) return;
    if (result) {
      InAppNotificationService.i.notify(
        NotificationMessage(
          id: "copy_to_clipboard_success",
          body: ctx.locale.app__ack__copied,
        ),
      );
      unawaited(_maybeShowReviewPrompt());
    }
  } catch (e) {
    InAppNotificationService.i.notify(
      NotificationMessage(
        id: "copy_to_clipboard_error",
        body: ctx.locale.app__unknown_error,
      ),
    );
  }
}

Future<void> copyToClipboard(
  BuildContext context,
  ClipboardItem item, {
  bool saveFile = false,
  bool noAck = false,
}) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return;

  if (!context.mounted) return;
  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  try {
    final cubit = ctx.read<OfflinePersistenceCubit>();
    final result = await cubit.copyToClipboard([item], saveFile: saveFile);
    if (!ctx.mounted) return;
    if (noAck) return;
    if (result) {
      InAppNotificationService.i.notify(
        NotificationMessage(
          id: "copy_to_clipboard_success",
          body: saveFile
              ? ctx.locale.app__ack__exported
              : ctx.locale.app__ack__copied,
        ),
      );
      unawaited(_maybeShowReviewPrompt());
    }
  } catch (e) {
    logger.e(() => "Error copying to clipboard: $e");
    InAppNotificationService.i.notify(
      NotificationMessage(
        id: "copy_to_clipboard_error",
        body: ctx.locale.app__unknown_error,
      ),
    );
  }
}

Future<void> openClipPreview(BuildContext context, ClipboardItem item) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return;

  if (!context.mounted) return;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  ctx.pushNamed(
    RouteConstants.preview,
    pathParameters: {"id": item.id.toString()},
    extra: RoutePayload(data: authorized),
  );
}

Future<void> shareClipboardItem(
  BuildContext context,
  ClipboardItem item,
) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return;

  if (!context.mounted) return;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  final errorMessage = ctx.locale.app__unknown_error;
  try {
    await ctx.read<OfflinePersistenceCubit>().shareClipboardItem(ctx, item);
  } catch (e) {
    logger.e(() => "Error sharing clipboard item: $e");
    InAppNotificationService.i.notify(
      NotificationMessage(id: "share_item_error", body: errorMessage),
    );
  }
}

Future<void> shareClipboardItems(
  BuildContext context,
  List<ClipboardItem> items,
) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return;

  if (!context.mounted) return;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  final errorMessage = ctx.locale.app__unknown_error;
  try {
    await ctx.read<OfflinePersistenceCubit>().shareClipboardItems(ctx, items);
  } catch (e) {
    logger.e(() => "Error sharing clipboard items: $e");
    InAppNotificationService.i.notify(
      NotificationMessage(id: "share_items_error", body: errorMessage),
    );
  }
}

Future<void> selectClip(BuildContext context, ClipboardItem item) async {
  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  ctx.read<SelectedClipsCubit>().select(item);
}

Future<ClipboardItem?> decryptItem(
  BuildContext context,
  ClipboardItem item,
) async {
  final persitCubit = context.read<OfflinePersistenceCubit>();
  final appConfig = context.read<AppConfigCubit>();
  if (!appConfig.isE2EESetupDone) {
    InAppNotificationService.i.notify(
      NotificationMessage(
        id: "e2ee-no-setup",
        body: context.locale.app__ack__missing_e2e_setup,
        action: SnackBarAction(
          label: context.locale.settings__appbar__title,
          onPressed: () {
            context.pushNamed(
              RouteConstants.settings,
              queryParameters: {"tab": "4"},
            );
          },
        ),
      ),
    );
    return null;
  }

  final authorized = await isAuthorized([item], context);
  if (!authorized) return null;

  if (!context.mounted) return null;

  final item_ = await item.decrypt();
  persitCubit.persist([item_], stateless: item.locked);
  return item_;
}

Future<void> downloadFile(BuildContext context, ClipboardItem item) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return;

  if (!context.mounted) return;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  ctx.read<FileCloudCubit>().download(item);
}

Future<void> launchUrl(ClipboardItem item) async {
  if (item.url != null && Uri.tryParse(item.url!) != null) {
    await launchUrlString(item.url!);
  }
}

Future<ClipboardItem?> editTextContent(
  BuildContext context,
  ClipboardItem item,
) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return null;

  if (!context.mounted) return null;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  return await ctx.pushNamed<ClipboardItem?>(
    RouteConstants.createClipNote,
    queryParameters: {"id": item.id.toString()},
    extra: RoutePayload(data: authorized),
  );
}

Future<void> launchPhone(ClipboardItem item, {bool message = false}) async {
  if (message) {
    await launchUrlString("sms:${item.text}");
  } else {
    await launchUrlString("tel:${item.text}");
  }
}

Future<void> launchEmail(ClipboardItem item) async {
  await launchUrlString("mailto:${item.text}");
}

Future<void> pasteOnLastWindow(BuildContext context, ClipboardItem item) async {
  final authorized = await isAuthorized([item], context);
  if (!authorized) return;

  if (!context.mounted) return;

  final focusManager = WindowFocusManager.of(context);
  final clipboard = sl<ClipboardService>();
  await clipboard.runWithCaptureSuppressed(() async {
    await copyToClipboard(context, item, noAck: true);
    await focusManager?.toggleAndPaste(item);
    await wait(Durations.medium1.inMilliseconds);
  });
  if (!context.mounted) return;
  unawaited(_maybeShowReviewPrompt());
}

List<ClipboardItem> selectedClips(BuildContext context) {
  final state = context.read<SelectedClipsCubit>().state;
  return state.maybeMap(
    clipSelected: (s) => s.selectedClipIds,
    orElse: () => <ClipboardItem>[],
  );
}

Future<void> pasteMultipleOnLastWindow(
  BuildContext context,
  List<ClipboardItem> items, {
  bool restoreFocusAfterPaste = false,
  String? textMergeSeparator,
  Duration? waitBetweenPastes,
}) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return;

  if (!context.mounted) return;

  final focusManager = WindowFocusManager.of(context);
  if (focusManager == null) return;

  await focusManager.pasteMultiple(
    items,
    restoreFocusAfterPaste: restoreFocusAfterPaste,
    textMergeSeparator: textMergeSeparator,
    waitBetweenPastes: waitBetweenPastes,
  );
}

Future<void> pasteSelectedOnLastWindow(
  BuildContext context, {
  bool clearSelection = false,
}) async {
  final selected = selectedClips(context);
  if (selected.isEmpty) return;

  await pasteMultipleOnLastWindow(context, selected);
  if (clearSelection && context.mounted) {
    context.read<SelectedClipsCubit>().clear();
  }
}

Future<void> copySelectedItems(
  BuildContext context, {
  bool clearSelection = false,
}) async {
  final selected = selectedClips(context);
  if (selected.isEmpty) return;

  await multiCopyToClipboard(context, selected);
  if (clearSelection && context.mounted) {
    context.read<SelectedClipsCubit>().clear();
  }
}

Future<bool> deleteClipboardItem(
  BuildContext context,
  List<ClipboardItem> items,
) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return false;

  if (!context.mounted) return false;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  final confirmation = await ConfirmDialog(
    title: context.locale.dialog__delete_clip__title,
    message: context.locale.dialog__delete_clip__subtitle(
      itemCount: items.length,
    ),
  ).show(ctx);

  if (!confirmation) return false;

  // ignore: use_build_context_synchronously
  await ctx.read<OfflinePersistenceCubit>().delete(items);
  return true;
}

Future<String> _ensureFileExtension(ClipboardItem item) async {
  final path = item.localPath!;
  final newPath = localPathWithMissingExtension(item);
  if (newPath == null || item.id == null) return path;

  // Ensure the file has the correct extension before opening it.
  // This is a patch for older version where files are cached extension less.
  try {
    final local = sl<ClipboardSource>(instanceName: 'local');
    final stored = await local.get(id: item.id);
    if (stored == null) return path;

    await File(path).rename(newPath);
    try {
      await local.update(stored.copyWith(localPath: newPath));
    } catch (_) {
      await File(newPath).rename(path);
      rethrow;
    }
    sl<SyncEventBus>().emit<ClipboardItem>((
      CrossSyncEventType.update,
      item.copyWith(localPath: newPath),
    ));
    return newPath;
  } catch (e) {
    logger.e(() => "Failed to add extension to cached file: $e");
    return path;
  }
}

Future<void> openFile(ClipboardItem item) async {
  if (item.localPath != null) {
    final filePath = await _ensureFileExtension(item);
    print(filePath);
    final result = await OpenFilex.open(filePath);

    switch (result.type) {
      case ResultType.error:
      case ResultType.noAppToOpen:
        final errorMessage =
            rootNavigationKey.currentContext?.locale.app__ack__no_app_for_file;
        if (errorMessage != null) {
          // showTextSnackbar(errorMessage);
          InAppNotificationService.i.notify(
            NotificationMessage(
              id: "open_file_error_no_app",
              body: errorMessage,
            ),
          );
        }
      case ResultType.permissionDenied:
        final errorMessage = rootNavigationKey
            .currentContext
            ?.locale
            .app__ack__perm_fail_to_open_file;
        if (errorMessage != null) {
          InAppNotificationService.i.notify(
            NotificationMessage(
              id: "open_file_error_permission_denied",
              body: errorMessage,
            ),
          );
        }
      case _:
    }
  }
}

Future<void> pasteContent(BuildContext context) async {
  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  InAppNotificationService.i.notify(
    NotificationMessage(id: "pasting", body: ctx.locale.app__ack__pasting),
  );
  await ctx.read<OfflinePersistenceCubit>().paste();
  InAppNotificationService.i.dismiss("pasting");
  InAppNotificationService.i.notify(
    NotificationMessage.builder(
      id: "pasted",
      builder: (context) =>
          NotificationContent(body: ctx.locale.app__ack__pasted),
    ),
  );
}

Future<void> changeCollection(
  BuildContext context,
  List<ClipboardItem> items,
) async {
  final authorized = await isAuthorized(items, context);
  if (!authorized) return;

  if (!context.mounted) return;

  final ctx = context.mounted ? context : rootNavigationKey.currentContext!;
  final cubit = ctx.read<OfflinePersistenceCubit>();

  final selectedCollectionId = items.isNotEmpty
      ? null
      : items.firstOrNull?.collectionId;

  final collection = await ctx.pushNamed<ClipCollection>(
    RouteConstants.clipCollectionSelection,
    queryParameters: {"id": selectedCollectionId.toString()},
  );

  if (collection != null && ctx.mounted) {
    final collectionCubit = ctx.read<ClipCollectionCubit>();
    if (collectionCubit.isReadOnly(collection)) return;

    final updatedItems = items
        .map(
          (item) => item.copyWith(
            collectionId: collection.id,
            serverCollectionId: collection.serverId,
            modified: systemTime(),
          ),
        )
        .toList();
    cubit.persist(updatedItems);
  }
}

Future<void> performPrimaryActionOnClip(
  BuildContext context,
  ClipboardItem item,
  bool canPaste,
) async {
  if (item.encrypted) {
    await decryptItem(context, item);
  } else if (item.needDownload) {
    await downloadFile(context, item);
  } else if (isMobilePlatform &&
      (item.type == ClipItemType.file || item.type == ClipItemType.media) &&
      !item.isImage) {
    await shareClipboardItem(context, item);
  } else if (canPaste) {
    await pasteOnLastWindow(context, item);
  } else {
    await copyToClipboard(context, item);
  }
}

Widget textSelectionToolbarButtonItems(
  BuildContext context,
  EditableTextState editableTextState,
) {
  final selectedText = editableTextState.textEditingValue.selection.textInside(
    editableTextState.textEditingValue.text,
  );
  final tempClipItem = ClipboardItem.fromText(selectedText);
  return AdaptiveTextSelectionToolbar.buttonItems(
    anchors: editableTextState.contextMenuAnchors,
    buttonItems: [
      ContextMenuButtonItem(
        onPressed: () async {
          await copyToClipboard(context, tempClipItem);
          ContextMenuController.removeAny();
        },
        type: ContextMenuButtonType.copy,
      ),
      if (isDesktopPlatform)
        ContextMenuButtonItem(
          onPressed: () async {
            await pasteOnLastWindow(context, tempClipItem);
            ContextMenuController.removeAny();
          },
          type: ContextMenuButtonType.paste,
        ),
      ...editableTextState.contextMenuButtonItems.skipWhile(
        (t) => [
          ContextMenuButtonType.copy,
          ContextMenuButtonType.paste,
        ].contains(t.type),
      ),
    ],
  );
}
