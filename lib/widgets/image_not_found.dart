import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox.expand(
      child: Ink(
        decoration: BoxDecoration(color: colors.surfaceContainerHigh),
        child: Padding(
          padding: const EdgeInsets.only(
            top: padding44,
            left: padding16,
            right: padding16,
          ),
          child: Icon(Icons.image_not_supported_rounded, color: colors.outline),
        ),
      ),
    );
  }
}
