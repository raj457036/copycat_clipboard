import 'package:clipboard/constants/widget_styles.dart';
import 'package:clipboard/db/clip_collection/clipcollection.dart';
import 'package:clipboard/pages/collections/pages/create_edit/widgets/create_edit_form.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:flutter/material.dart';

class ClipCollectionCreateEditDesktopPageContent extends StatelessWidget {
  final String title;
  final ClipCollection? collection;

  const ClipCollectionCreateEditDesktopPageContent(
      {super.key, required this.title, this.collection});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        width: 550,
        height: 550,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          height16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding16),
            child: Text(
              title,
              style: textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ClipCollectionCreateEditForm(
              collection: collection,
            ),
          ),
        ],
      ),
    );
  }
}

class ClipCollectionCreateEditMobilePageContent extends StatelessWidget {
  final ClipCollection? collection;

  const ClipCollectionCreateEditMobilePageContent({super.key, this.collection});

  @override
  Widget build(BuildContext context) {
    return ClipCollectionCreateEditForm(collection: collection);
  }
}

class ClipCollectionCreateEditPage extends StatelessWidget {
  final bool isDialog;
  final ClipCollection? collection;

  const ClipCollectionCreateEditPage({
    super.key,
    this.collection,
    this.isDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    final title = collection == null ? "Create Collection" : "Edit Collection";
    if (isDialog) {
      return ClipCollectionCreateEditDesktopPageContent(
        title: title,
        collection: collection,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ClipCollectionCreateEditMobilePageContent(
        collection: collection,
      ),
    );
  }
}
