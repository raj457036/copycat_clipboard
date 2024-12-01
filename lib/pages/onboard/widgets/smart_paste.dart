import 'package:animate_do/animate_do.dart';
import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';
import 'package:last_flutter_flex_player/flutter_flex_player.dart';
import 'package:last_flutter_flex_player/flutter_flex_player_controller.dart';

class SmartPasteStep extends StatefulWidget {
  final VoidCallback onContinue;
  const SmartPasteStep({super.key, required this.onContinue});

  @override
  State<SmartPasteStep> createState() => _SmartPasteStepState();
}

class _SmartPasteStepState extends State<SmartPasteStep> {
  late final FlutterFlexPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = FlutterFlexPlayerController();
    controller.load(
      NetworkFlexPlayerSource("https://www.youtube.com/watch?v=V2iW3djm6WA"),
      autoPlay: true,
      loop: true,
      mute: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ZoomIn(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.switch_access_shortcut_add_rounded,
              size: 32,
            ),
            height10,
            Text(
              "Smart Paste",
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium,
            ),
            FlutterFlexPlayer(
              controller,
            ),
            height8,
            ElevatedButton(
              onPressed: widget.onContinue,
              child: Text(
                context.locale.continue_,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
