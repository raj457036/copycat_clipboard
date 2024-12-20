import 'package:clipboard/pages/collections/pages/create_edit/page.dart';
import 'package:copycat_base/constants/numbers/breakpoints.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:flutter/material.dart';

Future<void> showCreateCollectionDialog(BuildContext context) async {
  final width = context.mq.size.width;
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
        child: ClipCollectionCreateEditPage(),
      ),
    );
  }
}
