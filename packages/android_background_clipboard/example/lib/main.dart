import 'dart:async';

import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _plugin = AndroidBackgroundClipboard();
  late final SharedPreferences pref;
  bool checking = false;
  bool isNotificationGranted = false;
  bool isOverlayGranted = false;
  bool isAccessibilityGranted = false;
  bool isBatteryOptEnabled = true;
  bool isServiceRunning = false;

  final items = <(String, String)>[];

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    SharedPreferences.setPrefix("");
    pref = await SharedPreferences.getInstance();
    runChecks();
  }

  Future<void> fetchItems() async {
    setState(() {
      items.clear();
    });
    await pref.reload();
    final keys = pref.getKeys();
    for (var key in keys) {
      final value = pref.get(key);
      items.add((key, value.toString()));
    }
    await pref.setString("SOME KEY", "SOME VALUE");
    setState(() {});
  }

  Future<void> runChecks() async {
    setState(() {
      checking = true;
    });

    isNotificationGranted = await _plugin.isNotificationPermissionGranted();
    isOverlayGranted = await _plugin.isOverlayPermissionGranted();
    isAccessibilityGranted = await _plugin.isAccessibilityPermissionGranted();
    isBatteryOptEnabled = await _plugin.isBatteryOptimizationEnabled();
    isServiceRunning = await _plugin.isServiceRunning();

    checking = false;

    if (!mounted) return;
    setState(() {});
  }

  Future<void> grantNotification() async {
    await _plugin.requestNotificationPermission();
    isNotificationGranted = await _plugin.isNotificationPermissionGranted();
    setState(() {});
  }

  Future<void> grantOverlay() async {
    await _plugin.requestOverlayPermission();
    isOverlayGranted = await _plugin.isOverlayPermissionGranted();
    setState(() {});
  }

  Future<void> grantAccessibility() async {
    await _plugin.openAccessibilityService();
    isAccessibilityGranted = await _plugin.isAccessibilityPermissionGranted();
    setState(() {});
  }

  Future<void> disableBatteryOptimization() async {
    await _plugin.requestUnrestrictedBatteryAccess();
    isBatteryOptEnabled = await _plugin.isBatteryOptimizationEnabled();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Battery Optimization Disabled? : ${!isBatteryOptEnabled}"),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: !isBatteryOptEnabled || checking
                      ? null
                      : disableBatteryOptimization,
                  child: isBatteryOptEnabled
                      ? const Text("Disable")
                      : const Text("Disabled"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Is Notification Granted : $isNotificationGranted"),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isNotificationGranted || checking
                      ? null
                      : grantNotification,
                  child: isNotificationGranted
                      ? const Text("Granted")
                      : const Text("Grant"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Is Overlay Granted : $isOverlayGranted"),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isOverlayGranted || checking ? null : grantOverlay,
                  child: isOverlayGranted
                      ? const Text("Granted")
                      : const Text("Grant"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Is Accessibility Granted : $isAccessibilityGranted"),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isAccessibilityGranted || checking
                      ? null
                      : grantAccessibility,
                  child: isAccessibilityGranted
                      ? const Text("Granted")
                      : const Text("Grant"),
                ),
              ],
            ),
            OverflowBar(
              children: [
                ElevatedButton.icon(
                  onPressed: checking ? null : runChecks,
                  label: const Text("Run Checks"),
                  icon: checking
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.check),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: fetchItems,
                  child: const Text("Fetch Items"),
                ),
              ],
            ),
            const Divider(),
            Text("Service Status: $isServiceRunning"),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(items[index].$1),
                    subtitle: Text(items[index].$2),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
