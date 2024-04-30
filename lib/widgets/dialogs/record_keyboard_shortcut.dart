import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:universal_io/io.dart';

class RecordKeyboardShortcutDialog extends StatefulWidget {
  const RecordKeyboardShortcutDialog({super.key});

  @override
  State<RecordKeyboardShortcutDialog> createState() =>
      _RecordKeyboardShortcutDialogState();

  Future<HotKey?> open(BuildContext context) async {
    return await showDialog<HotKey?>(
      context: context,
      builder: (context) => this,
    );
  }
}

class _RecordKeyboardShortcutDialogState
    extends State<RecordKeyboardShortcutDialog> {
  HotKey? hotKey;

  @override
  Widget build(BuildContext context) {
    final revert = Platform.isWindows;
    final options = [
      TextButton(
        onPressed: () => Navigator.pop(context, null),
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, hotKey),
        autofocus: true,
        child: const Text("Confirm"),
      ),
    ];
    return SimpleDialog(
      title: const Text("Record Keyboard Shortcut"),
      contentPadding: const EdgeInsets.all(padding16),
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: SizedBox(
            height: 50,
            child: Center(
              child: HotKeyRecorder(
                onHotKeyRecorded: (hotKey) {
                  setState(() {
                    this.hotKey = hotKey;
                  });
                },
              ),
            ),
          ),
        ),
        height12,
        const Text.rich(
          TextSpan(
            text: "Type your shortcut using your keyboard and click ",
            children: [
              TextSpan(
                text: "Confirm",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
        height12,
        ButtonBar(
          children: revert ? options.reversed.toList() : options,
        )
      ],
    );
  }
}
