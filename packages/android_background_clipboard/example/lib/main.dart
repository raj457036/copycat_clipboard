import 'dart:async';

import 'package:android_background_clipboard/android_background_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  bool _on = false;
  final _androidBackgroundClipboardPlugin = AndroidBackgroundClipboard();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    bool accessibilityOn;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _androidBackgroundClipboardPlugin.getPlatformVersion() ??
              'Unknown platform version';
      accessibilityOn = await _androidBackgroundClipboardPlugin
          .isAccessibilityPermissionGranted();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      accessibilityOn = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _on = accessibilityOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              Text("Accessibility: $_on"),
              ElevatedButton(
                  onPressed: _on
                      ? null
                      : () {
                          _androidBackgroundClipboardPlugin
                              .openAccessibilityService();
                        },
                  child: const Text('Grant'))
            ],
          ),
        ),
      ),
    );
  }
}
