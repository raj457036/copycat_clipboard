import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:clipboard/pages/settings/widgets/setting_header.dart';
import 'package:clipboard/widgets/pro_tip_banner.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class AndroidBgClipboardSettings extends StatefulWidget {
  final AndroidBackgroundClipboard bgService;

  const AndroidBgClipboardSettings({
    super.key,
    required this.bgService,
  });

  @override
  State<AndroidBgClipboardSettings> createState() =>
      _AndroidBgClipboardSettingsState();
}

class _AndroidBgClipboardSettingsState extends State<AndroidBgClipboardSettings>
    with WidgetsBindingObserver {
  bool loading = true;
  // service status
  bool isRunning = false;
  // required permissions
  bool notification = false;
  bool overlay = false;
  bool batteryOptimization = false;
  bool accessibility = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    checkStatus();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    super.didChangeAppLifecycleState(appLifecycleState);
    logger.w(appLifecycleState);

    switch (appLifecycleState) {
      case AppLifecycleState.resumed:
        checkStatus();
      default:
    }
  }

  Future<void> checkStatus() async {
    setState(() {
      loading = true;
    });

    notification = await widget.bgService.isNotificationPermissionGranted();
    overlay = await widget.bgService.isOverlayPermissionGranted();
    batteryOptimization =
        !await widget.bgService.isBatteryOptimizationEnabled();
    accessibility = await widget.bgService.isAccessibilityPermissionGranted();
    isRunning = await widget.bgService.isServiceRunning();

    setState(() {
      loading = false;
    });
  }

  Future<void> openNotificationSetting() async {
    await widget.bgService.requestNotificationPermission();
  }

  Future<void> openOverlaySetting() async {
    await widget.bgService.requestOverlayPermission();
  }

  Future<void> openBatteryOptimizationSetting() async {
    await widget.bgService.requestUnrestrictedBatteryAccess();
  }

  Future<void> openAccessibilitySetting() async {
    await widget.bgService.openAccessibilityService();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Center(
      child: CircularProgressIndicator(),
    );

    final checked = Icon(Icons.check).msp;
    final unchecked = Icon(Icons.close).msp;

    if (!loading) {
      child = ListView(
        children: [
          TipTile(
            title: "Clipboard Monitoring",
            tip:
                "Enable permissions to ensure CopyCat works seamlessly with your clipboard.",
          ),
          height5,
          SettingHeader(name: "Essential Permissions"),
          SwitchListTile(
            title: Text("Notification Access"),
            subtitle: Text(
              "Allows CopyCat to show an active notification for the running service.",
            ),
            value: notification,
            thumbIcon: notification ? checked : unchecked,
            onChanged: (_) => openNotificationSetting(),
          ),
          SwitchListTile(
            title: Text("Overlay Permission"),
            subtitle: Text(
              "Required to detect if something is copied.",
            ),
            value: overlay,
            thumbIcon: overlay ? checked : unchecked,
            onChanged: (_) => openOverlaySetting(),
          ),
          SwitchListTile(
            title: Text("Unrestricted Battery Optimization"),
            subtitle: Text(
              "To prevent system from closing the CopyCat service",
            ),
            thumbIcon: batteryOptimization ? checked : unchecked,
            value: batteryOptimization,
            onChanged: (_) => openBatteryOptimizationSetting(),
          ),
          SwitchListTile(
            title: Text("CopyCat Accessibility Service"),
            subtitle: Text(
              "Start the CopyCat background service",
            ),
            thumbIcon: accessibility ? checked : unchecked,
            value: accessibility,
            onChanged: (_) => openAccessibilitySetting(),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Background Listener"),
      ),
      body: child,
    );
  }
}
