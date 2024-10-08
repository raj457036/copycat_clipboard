import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        child: Text(context.locale.cancel),
      ),
      TextButton(
        onPressed: () => Navigator.pop(context, hotKey),
        autofocus: true,
        child: Text(context.locale.confirm),
      ),
    ];
    return SimpleDialog(
      title: Text(context.locale.recordKeyboardShortcut),
      contentPadding: const EdgeInsets.all(padding16),
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: SizedBox(
            height: 50,
            child: Center(
              child: HotKeyRecorder(
                onHotKeyRecorded: (hotKey) {
                  final isEnter =
                      hotKey.logicalKey == LogicalKeyboardKey.enter ||
                          hotKey.logicalKey == LogicalKeyboardKey.numpadEnter;

                  if (isEnter) return;
                  setState(() {
                    this.hotKey = hotKey;
                  });
                },
              ),
            ),
          ),
        ),
        height12,
        Text.rich(
          TextSpan(
            text: context.locale.recordKeyboardShortcutDesc,
            children: [
              TextSpan(
                text: context.locale.confirm,
                style: const TextStyle(
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
