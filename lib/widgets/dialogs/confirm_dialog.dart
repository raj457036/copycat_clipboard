import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:universal_io/io.dart";

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final revert = Platform.isWindows;

    final options = [
      TextButton(
        onPressed: () => context.pop(false),
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: () => context.pop(true),
        autofocus: true,
        child: const Text("Confirm"),
      ),
    ];
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: revert ? options.reversed.toList() : options,
    );
  }

  Future<bool> open(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => this,
        ) ??
        false;
  }
}
