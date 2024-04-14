// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AnimatedSyncingIcon extends StatefulWidget {
  const AnimatedSyncingIcon({super.key});

  @override
  _AnimatedSyncingIconState createState() => _AnimatedSyncingIconState();
}

class _AnimatedSyncingIconState extends State<AnimatedSyncingIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // repeat the animation indefinitely
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller.drive(Tween(begin: 0.0, end: -1.0)),
      child: const Icon(
        Icons.sync_rounded,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
