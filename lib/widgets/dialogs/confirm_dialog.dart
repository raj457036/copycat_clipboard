import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
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
        onPressed: () => Navigator.pop(context, false),
        child: Text(context.locale.cancel),
      ),
      TextButton(
        autofocus: true,
        onPressed: () => Navigator.pop(context, true),
        child: Text(context.locale.confirm),
      ),
    ];
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 250,
        child: Text(message),
      ),
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
