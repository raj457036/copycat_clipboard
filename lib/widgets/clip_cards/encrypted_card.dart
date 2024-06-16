import 'package:clipboard/constants/widget_styles.dart';
import 'package:flutter/material.dart';

class EncryptedClipItem extends StatelessWidget {
  const EncryptedClipItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.lock),
        height10,
        Text("Click to Decrypt"),
      ],
    ));
  }
}
