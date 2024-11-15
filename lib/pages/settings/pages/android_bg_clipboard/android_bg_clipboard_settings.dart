import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:copycat_base/common/logging.dart';
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
    batteryOptimization = await widget.bgService.isBatteryOptimizationEnabled();
    accessibility = await widget.bgService.isAccessibilityPermissionGranted();
    isRunning = await widget.bgService.isServiceRunning();

    setState(() {
      loading = false;
    });
  }

  Future<void> grantNotification() async {
    await widget.bgService.requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Center(
      child: CircularProgressIndicator(),
    );

    final grantedIcon = CircleAvatar(
      backgroundColor: context.colors.outlineVariant,
      child: Icon(Icons.check_circle, color: Colors.green),
    );

    if (!loading) {
      child = ListView(
        children: [
          ListTile(
            leading: Icon(Icons.circle_notifications),
            title: Text("Notification"),
            subtitle: Text(
              "Required to display acknowledgement for the running service.",
            ),
            trailing: notification
                ? grantedIcon
                : ElevatedButton(
                    onPressed: grantNotification,
                    child: Text("Grant"),
                  ),
          ),
          ListTile(
            leading: Icon(Icons.circle_notifications),
            title: Text("Overlay"),
            subtitle: Text(
              "Required to detect if something is copied",
            ),
            trailing: notification
                ? grantedIcon
                : ElevatedButton(
                    onPressed: grantNotification,
                    child: Text("Grant"),
                  ),
          )
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
