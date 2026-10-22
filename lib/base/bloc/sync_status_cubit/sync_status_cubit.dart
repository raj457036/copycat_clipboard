import 'dart:async' show StreamSubscription;

import 'package:bloc/bloc.dart';
import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/base/constants/numbers/values.dart';
import 'package:clipboard/base/data/services/notification_service.dart';
import 'package:clipboard/base/domain/model/notification_message.dart'
    show NotificationContent, NotificationMessage;
import 'package:clipboard/base/domain/model/subscription/subscription.dart';
import 'package:clipboard/base/domain/model/sync_status/syncstatus.dart';
import 'package:clipboard/base/domain/repositories/restoration_status.dart';
import 'package:clipboard/base/data/services/post_sync_decryption_service.dart';
import 'package:clipboard/base/domain/services/sync_event_bus.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/base/sync/sync_orchestrator.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart' show logger;
import 'package:clipboard/di/di.dart';
import 'package:clipboard/utils/subscription_actions.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:synchronized/synchronized.dart';

part 'sync_status_cubit.freezed.dart';
part 'sync_status_state.dart';

class SyncAllParams {
  final bool force;
  final bool freshPull;
  final bool restoration;

  const SyncAllParams({
    this.force = false,
    this.freshPull = false,
    this.restoration = false,
  });
}

class SyncProgressInitParams {
  final Map<String, int> totalCounts;
  const SyncProgressInitParams(this.totalCounts);
}

@lazySingleton
class SyncStatusCubit extends Cubit<SyncStatusState> {
  static const _notificationDedupeWindow = Duration(seconds: 1);
  static const _completionIdleDelay = Duration(milliseconds: 400);

  final MonetizationCubit monetizationCubit;
  final SyncOrchestrator orchestrator;
  final SyncEventBus eventBus;
  final PostSyncDecryptionService decryptionService;
  final RestorationStatusRepository restorationStatusRepository;
  StreamSubscription? _eventSub;
  final Set<String> _busyEngines = {};
  final Map<String, DateTime> _lastNotifiedAt = {};
  bool _isManualSyncing = false;
  DateTime? _lastManualSyncAt;
  Future<void>? _syncAllInFlight;
  bool _completionCheckPending = false;
  final Lock _syncLock = Lock();

  SyncStatusCubit(
    this.orchestrator,
    this.eventBus,
    this.monetizationCubit,
    this.decryptionService,
    this.restorationStatusRepository,
  ) : super(const SyncStatusState.unknown()) {
    _subscribeToEvents();
  }

  Subscription? get _activeSubscription =>
      monetizationCubit.state.when(unknown: () => null, active: (sub) => sub);

  Duration get _manualSyncCooldown => Duration(
    seconds: _activeSubscription?.syncInterval ?? defaultBestEffortSyncInterval,
  );

  int get _maxSyncHoursByPlan {
    final sub = _activeSubscription;
    if (sub == null) return defaultSyncHourOffset;
    if (sub.syncHours < 1) return defaultSyncHourOffset;
    return sub.syncHours;
  }

  /// Determines the pull offset for fresh pulls based on subscription status.
  int get pullOffset => _activeSubscription?.syncHours != null
      ? _activeSubscription!.syncHours.clamp(1, _maxSyncHoursByPlan) * 60 * 60
      : defaultSyncHourOffset * 60 * 60;

  void initializeProgress(SyncProgressInitParams params) {
    final progress = params.totalCounts.map(
      (key, value) => MapEntry(key, SyncProgress(synced: 0, total: value)),
    );
    emit(SyncStatusState.syncing(progress: progress));
  }

  void markDisabled() => emit(const SyncStatusState.disabled());

  void _subscribeToEvents() {
    _eventSub?.cancel();
    _eventSub = eventBus.stream.listen((event) async {
      await _syncLock.synchronized(() async {
        if (event is SyncProgressEvent) {
          final currentProgress = state.maybeWhen(
            syncing: (progress) => Map<String, SyncProgress>.from(progress),
            orElse: () => <String, SyncProgress>{},
          );

          final p = event.params;
          final existing = currentProgress[p.entityType];

          currentProgress[p.entityType] = SyncProgress(
            synced: p.fetchCount + (existing?.synced ?? 0),
            total: p.totalCount ?? existing?.total ?? 0,
          );

          emit(SyncStatusState.syncing(progress: currentProgress));
          await _checkCompletion();
        } else if (event is SyncEngineStatusUpdateEvent) {
          if (event.isBusy) {
            _busyEngines.add(event.entityType);
            if (state is! SyncingStatus) {
              emit(const SyncStatusState.syncing());
            }
          } else {
            _busyEngines.remove(event.entityType);
            await _checkCompletion();
          }
        } else if (event is SyncOutboxFailureEvent) {
          _notifyOutboxFailure(event);
        }
      });
    });
  }

  void _notifyOutboxFailure(SyncOutboxFailureEvent event) {
    final failure = _toUserFailure(event.failure);
    final key = '${event.entityType}:${failure.code}';
    final now = DateTime.now();
    final previous = _lastNotifiedAt[key];

    if (previous != null &&
        now.difference(previous) < _notificationDedupeWindow) {
      return;
    }

    _lastNotifiedAt[key] = now;
    InAppNotificationService.i.notify(
      NotificationMessage.builder(
        builder: (context) => NotificationContent(
          body: context.locale.app__ack__failed_to_sync(
            entityType: event.entityType,
            message: failure.message,
          ),
        ),
        id: key,
      ),
    );
  }

  Failure _toUserFailure(Failure failure) {
    if (failure.code == 'file-sync-not-enabled') {
      return const Failure(
        message:
            'File and media sync is disabled. Enable it in settings to sync attachments.',
        code: 'file-sync-not-enabled',
      );
    }
    return failure;
  }

  Future<void> _checkCompletion() async {
    if (_completionCheckPending ||
        _busyEngines.isNotEmpty ||
        _isManualSyncing) {
      return;
    }

    _completionCheckPending = true;
    try {
      await wait(_completionIdleDelay.inMilliseconds);
      if (_busyEngines.isNotEmpty || _isManualSyncing) {
        return;
      }
      await _completeSync();
    } finally {
      _completionCheckPending = false;
    }
  }

  Future<void> syncAll(SyncAllParams params) async {
    final inFlight = _syncAllInFlight;
    if (inFlight != null) {
      return inFlight;
    }

    late final Future<void> tracked;
    tracked = _runSyncAll(params).whenComplete(() {
      if (identical(_syncAllInFlight, tracked)) {
        _syncAllInFlight = null;
      }
    });
    _syncAllInFlight = tracked;
    return tracked;
  }

  Future<void> _runSyncAll(SyncAllParams params) async {
    final appConfig = sl<AppConfigCubit>().state.config;
    // final deviceAccess = sl<UserDevicesCubit>().state.accessStatus;

    if (!params.restoration && !appConfig.enableSync
    // || deviceAccess != DeviceAccessStatus.allowed
    ) {
      emit(const SyncStatusState.disabled());
      return;
    }

    if (_isOnManualCooldown(params)) {
      final cooldown = _manualSyncCooldown;
      final elapsed = systemTime().difference(_lastManualSyncAt!);
      final remaining = cooldown - elapsed;
      _notifyManualSyncCooldown(remaining);
      return;
    }

    if (params.force && !params.freshPull) {
      _lastManualSyncAt = systemTime();
    }

    _isManualSyncing = true;
    if (state is! SyncingStatus) {
      emit(const SyncStatusState.syncing());
    }

    try {
      final success = await orchestrator.syncAll(
        force: params.force,
        freshPull: params.freshPull,
        pullOffset: pullOffset,
      );
      if (success) {
        await _completeSync();
      } else {
        emit(
          const SyncStatusState.failed(
            Failure(
              message: 'Sync failed. Please try again.',
              code: 'sync_failed',
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        SyncStatusState.failed(
          Failure(message: e.toString(), code: 'sync_error'),
        ),
      );
    } finally {
      _isManualSyncing = false;
      await _checkCompletion();
    }
  }

  bool _isOnManualCooldown(SyncAllParams params) {
    if (!params.force || params.freshPull) return false;
    final lastSyncAt = _lastManualSyncAt;
    if (lastSyncAt == null) return false;

    final elapsed = systemTime().difference(lastSyncAt);
    return elapsed < _manualSyncCooldown;
  }

  void _notifyManualSyncCooldown(Duration remaining) {
    InAppNotificationService.i.notify(
      NotificationMessage.builder(
        id: 'manual_sync_cooldown',
        builder: (context) {
          final remainingText = remaining.pretty(
            abbreviated: true,
            locale:
                DurationLocale.fromLanguageCode(context.locale.localeName) ??
                const EnglishDurationLocale(),
          );
          return NotificationContent(
            body: context.locale.app__sync_cooldown(time: remainingText),
            action: SnackBarAction(
              label: context.locale.paywall_dialog__text__upgrade,
              onPressed: showUpgradePlanDialog,
            ),
          );
        },
      ),
    );
  }

  /// Runs a per-item decryption pass over all locally stored encrypted clips,
  /// then emits [SyncStatusState.complete]. Safe to call when the encryption
  /// worker is inactive — it will find zero encrypted items (or skip them) and
  /// proceed straight to [complete].
  Future<void> _completeSync() async {
    // Decrypt if service is available
    bool hasUxUpdates = false;

    if (decryptionService.canDecrypt) {
      await decryptionService.decryptAll(
        onProgress: (decrypted, total) {
          emit(SyncStatusState.decrypting(decrypted: decrypted, total: total));

          hasUxUpdates = decrypted == total && total > 0;
        },
      );
    }

    // Persist sync completion regardless of decryption status
    try {
      await restorationStatusRepository.setStatus(
        SyncStatus(lastSyncPoint: systemTime(), restorationPending: false),
      );
    } catch (e) {
      logger.e(() => 'Failed to persist sync status: $e');
    }

    emit(SyncStatusState.complete(hasUpdates: hasUxUpdates));
  }

  @override
  Future<void> close() {
    _eventSub?.cancel();
    return super.close();
  }
}
