import 'dart:async';
import 'dart:ui' as ui;

import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart';
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/data/services/notification_service.dart';
import 'package:clipboard/base/domain/model/notification_message.dart'
    show NotificationMessage;
import 'package:clipboard/base/l10n/l10n.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/di/di.dart';
import 'package:clipboard/pages/settings/pages/android_bg_clipboard/accessibility_service_notice.dart';
import 'package:clipboard/pages/settings/pages/android_bg_clipboard/detection_status_card.dart';
import 'package:clipboard/pages/settings/widgets/dropdowns/clipboard_feedback_dropdown.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/pages/settings/widgets/switches/auto_write_on_receive_switch.dart';
import 'package:clipboard/pages/settings/widgets/switches/lan_instant_sync_switch.dart';
import 'package:clipboard/widgets/settings_menu_dropdown.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard/widgets/pro_tip_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AndroidBgClipboardSettings extends StatefulWidget {
  final AndroidBackgroundClipboard bgService;
  final String deviceId;
  final bool liteMode;

  const AndroidBgClipboardSettings({
    super.key,
    required this.bgService,
    required this.deviceId,
    this.liteMode = false,
  });

  @override
  State<AndroidBgClipboardSettings> createState() =>
      _AndroidBgClipboardSettingsState();
}

class _AndroidBgClipboardSettingsState extends State<AndroidBgClipboardSettings>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  late final MonetizationCubit monetizationCubit;
  late final AppConfigCubit appConfigCubit;
  String? enc1Key;

  bool loading = true;
  bool writingConfig = false;
  // service status
  bool isRunning = false;
  // required permissions
  bool notification = false;
  bool batteryOptimization = false;
  int _statusCheckVersion = 0;
  Timer? _batteryStatusTimer;
  bool accessibility = false;
  bool enable = false;
  StreamSubscription<Map<String, String>>? _detectionStatusSubscription;
  Map<String, String>? _latestDetectionStatusPayload;
  String _detectionStatusState = 'inactive';
  String _detectionStatusOutcome = 'none';

  String _selectedMode = 'inactive';

  List<(String, String, IconData)> get _detectionModes => [
    (
      'inactive',
      context.locale.settings__clipboard_feedback__disabled,
      Icons.content_paste_off_rounded,
    ),
    (
      "mode_1_ack_text",
      context.locale.abc__detection_mode__mode_1,
      Icons.linear_scale_rounded,
    ),
    (
      "mode_2_aggressive",
      context.locale.abc__detection_mode__mode_2,
      Icons.linear_scale,
    ),
  ];

  String _normalizeDetectionMode(String? mode) {
    final value = (mode ?? '').trim();

    final supported = _detectionModes.any((entry) => entry.$1 == value);
    return supported ? value : 'inactive';
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    monetizationCubit = context.read();
    appConfigCubit = context.read();

    context.read<AuthCubit>().state.whenOrNull(
      authenticated: (user, _, _, _) {
        enc1Key = user.enc1;
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.bgService.initStorage();
      _subscribeToDetectionStatus();
      await checkStatus();
      await setupConfiguration();
    });
  }

  @override
  void dispose() {
    _batteryStatusTimer?.cancel();
    _detectionStatusSubscription?.cancel();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.resumed) {
      checkStatus();
    }
  }

  @override
  void didChangeViewFocus(ui.ViewFocusEvent event) {
    if (event.state == ui.ViewFocusState.focused &&
        event.viewId == View.of(context).viewId) {
      checkStatus();
    }
  }

  Future<void> checkStatus() async {
    if (!mounted) return;
    final version = ++_statusCheckVersion;
    setState(() {
      loading = true;
    });

    final notificationGranted = await widget.bgService
        .isNotificationPermissionGranted();
    final accessibilityGranted = await _readAccessibilityStatus();
    final serviceRunning = await widget.bgService.isServiceRunning();
    final unrestrictedBattery = !await widget.bgService
        .isBatteryOptimizationEnabled();

    if (!mounted || version != _statusCheckVersion) return;

    String selectedMode;
    if (!accessibilityGranted) {
      // Accessibility is off — reset mode to inactive so user picks fresh when they enable it.
      selectedMode = 'inactive';
      await widget.bgService.setDetectionMode('inactive');
    } else {
      final storedMode = await widget.bgService.readShared<String>(
        'detectionMode',
      );
      if (!mounted || version != _statusCheckVersion) return;
      selectedMode = _normalizeDetectionMode(storedMode);
      if (storedMode != null &&
          storedMode.isNotEmpty &&
          storedMode != selectedMode) {
        await widget.bgService.setDetectionMode(selectedMode);
      }
    }

    if (!mounted || version != _statusCheckVersion) return;

    setState(() {
      notification = notificationGranted;
      accessibility = accessibilityGranted;
      isRunning = serviceRunning;
      batteryOptimization = unrestrictedBattery;
      _selectedMode = selectedMode;
      if (!accessibility || _selectedMode == 'inactive') {
        _detectionStatusState = 'inactive';
        _detectionStatusOutcome = 'none';
      }
      loading = false;
    });

    _applyLatestDetectionStatus();
  }

  Future<bool> _readAccessibilityStatus() async {
    return widget.bgService.isAccessibilityPermissionGranted();
  }

  (String, String) _statusForMode(String mode) {
    return switch (mode) {
      'inactive' => ('inactive', 'none'),
      'mode_1_ack_text' => ('starting', 'pending'),
      'mode_2_aggressive' => ('running_aggressive', 'none'),
      _ => ('inactive', 'none'),
    };
  }

  void _setDisplayedDetectionStatus(String state, String outcome) {
    if (!mounted) return;
    if (state == _detectionStatusState && outcome == _detectionStatusOutcome) {
      return;
    }

    setState(() {
      _detectionStatusState = state;
      _detectionStatusOutcome = outcome;
    });
  }

  void _applyLatestDetectionStatus() {
    if (!accessibility || _selectedMode == 'inactive') {
      _setDisplayedDetectionStatus('inactive', 'none');
      return;
    }

    final payload = _latestDetectionStatusPayload;
    if (payload == null) {
      return;
    }

    final state = (payload['state'] ?? 'inactive').trim();
    final outcome = (payload['outcome'] ?? 'none').trim();
    _setDisplayedDetectionStatus(state, outcome);
  }

  void _subscribeToDetectionStatus() {
    _detectionStatusSubscription?.cancel();
    _detectionStatusSubscription = widget.bgService
        .detectionStatusStream()
        .listen((payload) {
          if (!mounted) return;

          _latestDetectionStatusPayload = {
            'state': (payload['state'] ?? 'inactive').trim(),
            'outcome': (payload['outcome'] ?? 'none').trim(),
          };
          _applyLatestDetectionStatus();
        });
  }

  Future<void> openNotificationSetting() async {
    if (notification) {
      await widget.bgService.openNotificationSetting();
      return;
    }

    await widget.bgService.requestNotificationPermission();

    notification = await widget.bgService.isNotificationPermissionGranted();
    setState(() {});
  }

  Future<void> openBatteryOptimizationSetting() async {
    _batteryStatusTimer?.cancel();
    final displayedAsGranted = batteryOptimization;
    final optimizationEnabled = await widget.bgService
        .isBatteryOptimizationEnabled();
    if (!mounted) return;

    if (!optimizationEnabled) {
      if (!displayedAsGranted) {
        await checkStatus();
        return;
      }
      await widget.bgService.openBatteryOptimizationSetting();
    } else {
      await widget.bgService.requestUnrestrictedBatteryAccess();
    }

    await checkStatus();
    if (mounted) {
      _watchBatteryStatusChange(optimizationEnabled);
    }
  }

  void _watchBatteryStatusChange(bool previousOptimizationEnabled) {
    if (batteryOptimization == previousOptimizationEnabled) return;
    var reading = false;
    _batteryStatusTimer = Timer.periodic(const Duration(milliseconds: 250), (
      timer,
    ) async {
      if (timer.tick >= 20) timer.cancel();
      if (!mounted || reading) return;
      reading = true;
      try {
        final enabled = await widget.bgService.isBatteryOptimizationEnabled();
        if (!mounted || _batteryStatusTimer != timer) return;
        if (enabled != previousOptimizationEnabled) {
          timer.cancel();
          _statusCheckVersion++;
          setState(() {
            batteryOptimization = !enabled;
            loading = false;
          });
        }
      } catch (e, st) {
        timer.cancel();
        logger.w(
          'Failed to refresh battery optimization status',
          error: e,
          stackTrace: st,
        );
      } finally {
        reading = false;
      }
    });
  }

  Future<void> openAccessibilitySetting() async {
    if (!accessibility) {
      final agree = await const AccessibilityServiceNotice().show(context);

      if (!agree) {
        return;
      }
    }

    await widget.bgService.openAccessibilityService();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> setupConfiguration() async {
    InAppNotificationService.i.notify(
      NotificationMessage(
        id: "bg_setup",
        body: context.locale.abc__ack__preparing,
      ),
    );
    setState(() {
      writingConfig = true;
    });
    try {
      final enc1Decrypt = await appConfigCubit.decryptEnc2(enc1Key);
      final useEncryptionNonce = appConfigCubit.state.config.useEncryptionNonce;
      final syncSpeed = appConfigCubit.state.config.syncSpeed.name;
      final syncInterval = monetizationCubit.active?.syncInterval ?? 45;
      final tkn = monetizationCubit.active?.tkn;
      if (tkn != null) {
        await widget.bgService.writeShared(
          "sharedAccessKey",
          tkn,
          secure: true,
        );
      }
      await widget.bgService.writeShared("syncEnabled", true);
      await widget.bgService.writeShared(
        "autoWriteOnReceive",
        appConfigCubit.state.config.autoWriteOnReceive,
      );
      await widget.bgService.writeShared(
        "dontCopyOver",
        appConfigCubit.state.config.dontCopyOver,
      );
      await widget.bgService.writeShared("syncSpeed", syncSpeed);
      await widget.bgService.writeShared("syncInterval", syncInterval);
      await widget.bgService.writeShared("deviceId", widget.deviceId);
      await widget.bgService.writeShared(
        "clipboardFeedbackMode",
        appConfigCubit.state.config.clipboardFeedbackMode.name,
      );
      await widget.bgService.writeShared("showAckToast", true);
      await widget.bgService.writeShared("serviceEnabled", true);
      await widget.bgService.writeShared(
        "useEncryptionNonce",
        useEncryptionNonce,
      );
      await widget.bgService.writeShared(
        "projectKey",
        sl<String>(instanceName: "supabase_project_key"),
        secure: true,
      );
      if (enc1Decrypt != null) {
        await widget.bgService.writeShared(
          "e2e_key",
          enc1Decrypt,
          secure: true,
        );
      }
      await widget.bgService.writeShared(
        "projectApiKey",
        sl<String>(instanceName: "supabase_key"),
        secure: true,
      );
      await wait(1000);
      if (!mounted) return;

      InAppNotificationService.i.notify(
        NotificationMessage(
          id: "bg_setup_success",
          body: context.locale.abc__ack__ready,
        ),
      );
    } catch (e) {
      logger.e(e);
    } finally {
      InAppNotificationService.i.dismiss("bg_setup");
      setState(() {
        writingConfig = false;
      });
    }
  }

  Future<void> _onModeChanged(String? newMode) async {
    if (newMode == null) return;

    final normalizedMode = _normalizeDetectionMode(newMode);
    if (normalizedMode == _selectedMode) {
      return;
    }

    final previousMode = _selectedMode;
    final previousStatusState = _detectionStatusState;
    final previousStatusOutcome = _detectionStatusOutcome;
    final nextStatus = _statusForMode(normalizedMode);

    setState(() {
      _selectedMode = normalizedMode;
      _detectionStatusState = nextStatus.$1;
      _detectionStatusOutcome = nextStatus.$2;
    });

    try {
      await widget.bgService.setDetectionMode(normalizedMode);
      if (normalizedMode == 'inactive') {
        setState(() {
          _detectionStatusState = 'inactive';
          _detectionStatusOutcome = 'none';
        });
      }

      if (!mounted) return;

      // InAppNotificationService.i.notify(
      //   NotificationMessage(
      //     id: "detection_mode_updated",
      //     body: normalizedMode == 'inactive'
      //         ? context.locale.abc__ack__detection_mode_cleared
      //         : context.locale.abc__ack__detection_mode_updated,
      //   ),
      // );
    } catch (e) {
      logger.e("Failed to update detection mode: $e");
      if (!mounted) return;

      setState(() {
        _selectedMode = previousMode;
        _detectionStatusState = previousStatusState;
        _detectionStatusOutcome = previousStatusOutcome;
      });

      InAppNotificationService.i.notify(
        NotificationMessage(
          id: "detection_mode_update_failed",
          body: context.locale.abc__ack__detection_mode_update_failed(
            message: e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final isLight = context.theme.brightness == Brightness.light;
    final textTheme = context.textTheme;
    final colors = context.colors;
    final canChooseMode = accessibility && !writingConfig;
    final checked = const Icon(Icons.check).wsp;
    final unchecked = const Icon(Icons.close).wsp;

    final child = Material(
      child: ListView(
        children: [
          TipTile(
            title: context.locale.abc__tip__why_title,
            tip: context.locale.abc__tip__why_subtitle,
          ),
          height5,
          SettingHeader(name: context.locale.abc__heading__req_perm),
          SwitchListTile(
            title: Text(context.locale.abc__tile__notification_title),
            subtitle: Text(context.locale.abc__tile__notification_subtitle),
            value: notification,
            enableFeedback: true,
            thumbIcon: notification ? checked : unchecked,
            onChanged: writingConfig ? null : (_) => openNotificationSetting(),
          ),
          SwitchListTile(
            title: Text(context.locale.abc__tile__battery_opt_title),
            subtitle: Text(context.locale.abc__tile__battery_opt_subtitle),
            value: batteryOptimization,
            enableFeedback: true,
            thumbIcon: batteryOptimization ? checked : unchecked,
            onChanged: writingConfig || !notification
                ? null
                : (_) => openBatteryOptimizationSetting(),
          ),
          SwitchListTile(
            title: Text(context.locale.abc__tile__acc_title),
            subtitle: Text(context.locale.abc__tile__acc_subtitle),
            value: accessibility,
            enableFeedback: true,
            thumbIcon: accessibility ? checked : unchecked,
            onChanged: writingConfig || !notification || !batteryOptimization
                ? null
                : (_) => openAccessibilitySetting(),
          ),
          height5,
          ListTile(
            title: Text(context.locale.abc__detection_mode__title),
            subtitle: Text(
              accessibility
                  ? context.locale.abc__detection_mode__subtitle__enabled
                  : context.locale.abc__detection_mode__subtitle__disabled,
              style: textTheme.bodyMedium?.copyWith(color: colors.outline),
            ),
            trailing: SizedBox(
              width: 185,
              child: SettingsMenuDropdown<String>(
                value: _normalizeDetectionMode(_selectedMode),
                items: _detectionModes
                    .map(
                      (mode) => SettingsDropdownItem(
                        value: mode.$1,
                        enabled: accessibility || mode.$1 == 'inactive',
                      ),
                    )
                    .toList(),
                itemBuilder: (context, value) {
                  final label = _detectionModes
                      .firstWhere((mode) => mode.$1 == value)
                      .$2;
                  final icon = _detectionModes
                      .firstWhere((mode) => mode.$1 == value)
                      .$3;
                  return (
                    leading: Icon(icon),
                    child: Text(label),
                    trailing: null,
                  );
                },
                onSelected: canChooseMode ? _onModeChanged : null,
              ),
            ),
          ),
          height5,
          DetectionStatusCard(
            state: _detectionStatusState,
            outcome: _detectionStatusOutcome,
          ),
          height5,
          if (!widget.liteMode)
            ClipboardFeedbackDropdownTile(
              enabled: !writingConfig && isRunning && accessibility,
            ),
          if (!widget.liteMode)
            AutoWriteOnReceiveSwitchTile(
              enabled: !writingConfig && isRunning && accessibility,
              onChanged: (val) async {
                await widget.bgService.writeShared("autoWriteOnReceive", val);
              },
            ),
          if (canChooseMode) height5,
          if (!widget.liteMode)
            SettingHeader(name: context.locale.abc__network__header),
          if (!widget.liteMode)
            LanInstantSyncSwitchTile(serviceActive: isRunning && accessibility),
        ],
      ),
    );

    return PopScope(
      canPop: !writingConfig,
      child: loading ? IgnorePointer(child: child) : child,
    );
  }

  @override
  bool get wantKeepAlive => widget.liteMode;
}
