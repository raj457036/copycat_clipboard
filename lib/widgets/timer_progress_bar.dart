import 'package:copycat_base/constants/widget_styles.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

class TimerProgressBar extends StatefulWidget {
  final Duration duration;
  final bool circular;

  const TimerProgressBar({
    super.key,
    required this.duration,
    this.circular = false,
  });

  @override
  State<TimerProgressBar> createState() => _TimerProgressBarState();
}

class _TimerProgressBarState extends State<TimerProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    animation = Tween<double>(begin: 1, end: 0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        if (widget.circular) {
          return Padding(
            padding: const EdgeInsets.all(padding10),
            child: CircularProgressIndicator(
              value: animation.value,
              backgroundColor: colors.surface,
            ),
          );
        }
        return LinearProgressIndicator(
          value: animation.value,
          backgroundColor: colors.surface,
          borderRadius: radius12,
        );
      },
    );
  }
}
