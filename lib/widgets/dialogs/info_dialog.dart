import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;

  const InfoDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 250,
        child: Text(message),
      ),
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
