import 'dart:async';

import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/clip_cards/file_clip_card.dart';
import 'package:clipboard/widgets/clip_cards/media_clip_card.dart';
import 'package:clipboard/widgets/subscription/subscription_builder.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:universal_io/io.dart';

class DraggableItem extends StatelessWidget {
  final ClipboardItem item;
  final Widget child;

  const DraggableItem({super.key, required this.item, required this.child});

  Widget previewBuilder(BuildContext context, Widget child) {
    final colors = context.colors;
    final textTheme = context.textTheme;
    late Widget content;
    switch (item.type) {
      case ClipItemType.text:
      case ClipItemType.url:
        content = Center(
          child: Padding(
            padding: const EdgeInsets.all(padding12),
            child: Text(
              item.text ?? item.url!,
              style: textTheme.bodyMedium?.copyWith(color: colors.onSurface),
            ),
          ),
        );

      case ClipItemType.media:
        content = ClipRRect(
          borderRadius: radius12,
          child: MediaClipCard(item: item),
        );

      case ClipItemType.file:
        content = FileClipCard(item: item);
    }

    return SizedBox.square(
      dimension: 150,
      child: Card.outlined(child: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (item.needDownload || item.encrypted) return child;

    return HasAccessToFeature(
      hasAccess: (subscription) =>
          subscription.isActive && subscription.dragNdrop,
      fallbackWidget: child,
      alwaysBuild: false,
      builder: (context, hasAccess, _) {
        return DragItemWidget(
          canAddItemToExistingSession: true,
          dragItemProvider: dragItemProvider,
          allowedOperations: () => const [
            DropOperation.copy,
            // DropOperation.userCancelled,
          ],
          liftBuilder: previewBuilder,
          dragBuilder: previewBuilder,
          child: DraggableWidget(child: child),
        );
      },
    );
  }

  FutureOr<DragItem?> dragItemProvider(DragItemRequest request) async {
    final dragItem = DragItem(
      localData: {"itemId": item.id},
      suggestedName: _suggestedNameForItem(),
    );

    switch (item.type) {
      case ClipItemType.text:
        dragItem.add(Formats.plainText(item.text!));

      case ClipItemType.url:
        dragItem.add(
          Formats.uri(NamedUri(Uri.parse(item.url!), name: item.title)),
        );

      case ClipItemType.media:
      case ClipItemType.file:
        await _addImageRepresentationIfPossible(dragItem);
        final uri = await resolveFileUri(item.localPath!);
        final fileUri = Formats.fileUri(uri);
        dragItem.add(fileUri);
    }

    return dragItem;
  }

  String? _suggestedNameForItem() {
    if (item.fileName != null && item.fileName!.trim().isNotEmpty) {
      return item.fileName!.trim();
    }

    final path = item.localPath?.trim();
    if (path == null || path.isEmpty) {
      return null;
    }

    final segments = Uri.file(path, windows: Platform.isWindows).pathSegments;
    if (segments.isEmpty) {
      return null;
    }

    final name = segments.last.trim();
    return name.isEmpty ? null : name;
  }

  Future<void> _addImageRepresentationIfPossible(DragItem dragItem) async {
    final path = item.localPath?.trim();
    final mime = item.fileMimeType?.toLowerCase().trim();
    if (path == null || path.isEmpty || !item.isImage) {
      return;
    }

    final imageFile = File(path);
    if (!await imageFile.exists()) {
      return;
    }

    final bytes = await imageFile.readAsBytes();
    switch (mime) {
      case 'image/png':
        dragItem.add(Formats.png(bytes));
      case 'image/jpeg':
      case 'image/jpg':
        dragItem.add(Formats.jpeg(bytes));
      case 'image/gif':
        dragItem.add(Formats.gif(bytes));
      case 'image/webp':
        dragItem.add(Formats.webp(bytes));
      case 'image/bmp':
        dragItem.add(Formats.bmp(bytes));
      case 'image/heic':
        dragItem.add(Formats.heic(bytes));
      case 'image/heif':
        dragItem.add(Formats.heif(bytes));
    }
  }
}
