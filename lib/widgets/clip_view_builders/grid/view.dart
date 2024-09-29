import 'package:clipboard/widgets/can_paste_builder.dart';
import 'package:clipboard/widgets/clip_view_builders/grid/provider.dart';
import 'package:flutter/material.dart';

class ClipGrid extends StatelessWidget {
  final Widget Function(
      SliverGridDelegate delegate, Axis scrollDirection, bool canPaste) builder;

  const ClipGrid({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ClipGridDelegateProvider(
        builder: (context, delegate, scrollDirection) {
      return CanPasteBuilder(builder: (context, canPaste) {
        return builder(delegate, scrollDirection, canPaste);
      });
    });
  }
}
