import 'dart:async';

import 'package:flutter/material.dart';

class TimerBuilder extends StatefulWidget {
  final int maxTicks;
  final Widget Function(BuildContext context, int remaining, String seconds)
      builder;
  const TimerBuilder({
    super.key,
    required this.maxTicks,
    required this.builder,
  });

  @override
  State<TimerBuilder> createState() => _TimerBuilderState();
}

class _TimerBuilderState extends State<TimerBuilder> {
  late final Timer timer;
  bool finished = false;
  int tick = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), onTick);
  }

  void onTick(Timer timer) {
    tick++;
    setState(() {});
    if (tick == widget.maxTicks) {
      timer.cancel();
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remaining = widget.maxTicks - tick;
    return widget.builder(
        context, remaining, remaining > 0 ? '• $remaining s' : '');
  }
}
