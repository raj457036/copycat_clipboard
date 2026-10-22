import 'dart:async';

import 'package:clipboard/base/background/encryption_worker.dart';
import 'package:clipboard/base/bloc/android_bg_clipboard_cubit/android_bg_clipboard_cubit.dart';
import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/app_lock_cubit/app_lock_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/bloc/clip_collection_cubit/clip_collection_cubit.dart';
import 'package:clipboard/base/bloc/clipboard_cubit/clipboard_cubit.dart';
import 'package:clipboard/base/bloc/drive_setup_cubit/drive_setup_cubit.dart';
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/bloc/review_prompt_cubit/review_prompt_cubit.dart';
import 'package:clipboard/base/bloc/sync_status_cubit/sync_status_cubit.dart';
import 'package:clipboard/base/bloc/user_devices_cubit/user_devices_cubit.dart';
import 'package:clipboard/base/bloc/webdav_setup_cubit/webdav_setup_cubit.dart';
import 'package:clipboard/base/constants/strings/route_constants.dart';
import 'package:clipboard/base/data/services/notification_service.dart';
import 'package:clipboard/base/domain/model/notification_message.dart';
import 'package:clipboard/base/domain/services/database_service.dart';
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/base/sync/sync_orchestrator.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/routes/routes.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/yarn_ball_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_io/io.dart';

class AuthListener extends StatefulWidget {
  final Widget child;

  const AuthListener({super.key, required this.child});

  @override
  State<AuthListener> createState() => _AuthListenerState();
}

class _AuthListenerState extends State<AuthListener> {
  bool _isCompletingAuthentication = false;
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    _lifecycleListener = AppLifecycleListener(
      onResume: () => unawaited(_startEncryptionIfKeychainWasLocked()),
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  /// The keychain can be locked at launch (login/wake). The user can only
  /// bring the app to the foreground once it's unlocked, so retry then.
  Future<void> _startEncryptionIfKeychainWasLocked() async {
    final authState = sl<AuthCubit>().state;
    if (authState is! AuthenticatedAuthState) return;
    if (!await sl<AppConfigCubit>().retryE2EEKeyReadIfFailed()) return;
    logger.i("E2EE key readable after keychain unlock, starting encryption.");
    await initEncryptionWorker(authState);
  }

  Future<void> initEncryptionWorker(AuthenticatedAuthState authState) async {
    final appConfigCubit = sl<AppConfigCubit>();
    final encryptionWorker = EncryptionWorker.instance;
    await encryptionWorker.waitUntilReady();

    final enc1 = authState.user.enc1;
    final enc1Decrypt = await appConfigCubit.decryptEnc2(enc1);

    if (enc1Decrypt == null) return;
    await encryptionWorker.start(enc1Decrypt);
    await wait(Durations.medium4.inMilliseconds);
    final config = appConfigCubit.state.config;
    encryptionWorker.setEncryption(config.autoEncrypt);
    encryptionWorker.setDecryption(true);
  }

  Future<void> resetAll(BuildContext context, {bool logout = false}) async {
    EncryptionWorker.instance.dispose();
    InAppNotificationService.i.dismissAll();

    if (logout) {
      InAppNotificationService.i.notify(
        NotificationMessage.builder(
          id: "logout_success",
          builder: (context) => NotificationContent(
            body: context.locale.app__ack__logout_success,
          ),
        ),
      );
    }

    await clearPersistedRootDir();
    await sl<DatabaseService>().clearAll();
    sl<OfflinePersistenceCubit>().stopListeners();
    sl<UserDevicesCubit>().clear();
    sl<AppConfigCubit>().reset();
    sl<SyncOrchestrator>().stop();
    sl<MonetizationCubit>().logout();
    sl<ClipCollectionCubit>().reset();
    sl<WebDavSetupCubit>().reset();
  }

  Future<void> _handleAuthenticatedState(
    BuildContext context,
    AuthenticatedAuthState state,
  ) async {
    final reviewPromptCubit = context.read<ReviewPromptCubit>();
    final monetizationCubit = sl<MonetizationCubit>();
    await monetizationCubit.login(state.user.userId);

    if (state.isEncryptionKeySetup) {
      unawaited(initEncryptionWorker(state));
    }

    if (!state.isOnboardingCompleted) {
      reviewPromptCubit.setEnabled(false);
      appRouter.goNamed(RouteConstants.onboard);
      return;
    }

    reviewPromptCubit.setEnabled(true);

    unawaited(sl<OfflinePersistenceCubit>().startListeners());
    unawaited(sl<ClipCollectionCubit>().fetch(fromTop: true));
    unawaited(sl<ClipboardCubit>().fetch(fromTop: true));
    unawaited(sl<DriveSetupCubit>().fetch());
    unawaited(sl<WebDavSetupCubit>().fetch());
    if (Platform.isAndroid) {
      unawaited(sl<AndroidBgClipboardCubit>().syncStates());
    }

    final appConfigCubit = sl<AppConfigCubit>();

    if (appConfigCubit.isSyncEnabled) {
      unawaited(sl<SyncStatusCubit>().syncAll(const SyncAllParams()));
    } else {
      sl<SyncStatusCubit>().markDisabled();
    }
    appRouter.goNamed(RouteConstants.home);
    sl<AppLockCubit>().onAppForeground();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        if (previous is UnauthenticatedAuthState &&
            current is UnauthenticatedAuthState) {
          return false;
        }
        return previous != current;
      },
      listener: (context, state) async {
        switch (state) {
          case AuthenticatedAuthState():
            logger.d("User ID: ${state.user.userId}");
            setState(() => _isCompletingAuthentication = true);
            try {
              await _handleAuthenticatedState(context, state);
            } finally {
              if (mounted) {
                setState(() => _isCompletingAuthentication = false);
              }
            }
          case UnauthenticatedAuthState(:final failure):
            context.read<ReviewPromptCubit>().setEnabled(false);
            if (failure != null && failure != authFailure) {
              InAppNotificationService.i.notify(
                NotificationMessage(
                  id: "logout_failure",
                  body: failure.message,
                ),
              );
            }
            unawaited(resetAll(context, logout: failure == null));
            await context.windowAction?.show();
            appRouter.goNamed(RouteConstants.login);
          case LocalAuthenticatedAuthState():
            // MARK: - Offline Authentication Success
            final appConfigCubit = sl<AppConfigCubit>();
            if (!appConfigCubit.loaded.isCompleted) {
              await appConfigCubit.loaded.future;
            }
            if (!context.mounted) return;
            final isOnboarded = appConfigCubit.state.config.onBoardComplete;
            context.read<ReviewPromptCubit>().setEnabled(isOnboarded);
            unawaited(sl<OfflinePersistenceCubit>().startListeners());
            unawaited(sl<ClipCollectionCubit>().fetch(fromTop: true));
            unawaited(sl<ClipboardCubit>().fetch(fromTop: true));
            unawaited(sl<WebDavSetupCubit>().fetch());
            if (Platform.isAndroid) {
              unawaited(sl<AndroidBgClipboardCubit>().syncStates());
            }
            appRouter.goNamed(RouteConstants.home);
            sl<AppLockCubit>().onAppForeground();
        }
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            widget.child,
            if (_isCompletingAuthentication)
              const Positioned.fill(
                child: AbsorbPointer(
                  child: Material(child: Center(child: YarnBallLoading())),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
