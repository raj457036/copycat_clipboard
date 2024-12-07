import 'package:animate_do/animate_do.dart';
import 'package:clipboard/pages/settings/widgets/switches/system_shortcut_switch.dart';
import 'package:clipboard/widgets/loop_video_player.dart';
import 'package:copycat_base/constants/strings/strings.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class KeyboardShortcutStep extends StatelessWidget {
  final VoidCallback onContinue;
  const KeyboardShortcutStep({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Platform.isMacOS
                    ? Icons.keyboard_command_key_rounded
                    : Icons.window,
                size: 32,
              ),
              height10,
              Text(
                "Clipboard Shortcut",
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              height10,
              LoopVideoPlayer(
                width: 620,
                borderRadius: radius16,
                url: keyboardShortcutDemoVideo,
              ),
              height10,
              SizedBox(width: 620, child: ClipboardHotKeySwitch()),
              height10,
              FilledButton(
                onPressed: onContinue,
                child: Text(
                  context.locale.continue_,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
