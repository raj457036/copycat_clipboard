import 'package:clipboard/constants/numbers/breakpoints.dart';
import 'package:clipboard/pages/collections/pages/create_edit/page.dart';
import 'package:flutter/material.dart';

Future<void> showCreateCollectionDialog(BuildContext context) async {
  final width = MediaQuery.of(context).size.width;
  final isMobile = Breakpoints.isMobile(width);

  if (isMobile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const Scaffold(
          body: ClipCollectionCreateEditPage(),
        ),
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => const Dialog(
        child: ClipCollectionCreateEditPage(isDialog: true),
      ),
    );
  }
}
