import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ProTipTile extends StatelessWidget {
  final String tip;
  const ProTipTile({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ListTile(
      title: const Text("👌 Pro Tip"),
      subtitle: Text(tip),
      tileColor: colors.primaryContainer,
      trailing: CloseButton(onPressed: () {}),
    );
  }
}
