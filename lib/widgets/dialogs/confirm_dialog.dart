import 'package:clipboard/widgets/timer_builder.dart';
import 'package:copycat_base/l10n/l10n.dart';
import 'package:flutter/material.dart';
import "package:universal_io/io.dart";

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? yes, no;
  final int confirmationDelay;
  final bool? focusFor;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmationDelay = 0,
    this.yes,
    this.no,
    this.focusFor = true,
  });

  @override
  Widget build(BuildContext context) {
    final revert = Platform.isWindows;

    final options = [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        autofocus: focusFor == false,
        child: Text(no ?? context.locale.cancel),
      ),
      if (confirmationDelay > 0)
        TimerBuilder(
          maxTicks: confirmationDelay,
          builder: (context, remaining, seconds) => TextButton(
            autofocus: remaining > 0 ? false : focusFor == true,
            onPressed:
                remaining > 0 ? null : () => Navigator.pop(context, true),
            child:
                Text("${yes ?? context.locale.confirm} $seconds".trimRight()),
          ),
        )
      else
        TextButton(
          autofocus: focusFor == true,
          onPressed: () => Navigator.pop(context, true),
          child: Text(yes ?? context.locale.confirm),
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
