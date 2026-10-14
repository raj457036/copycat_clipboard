import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class TextThumbnailView extends StatefulWidget {
  final String filePath;
  final bool isFullView;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  const TextThumbnailView({
    super.key,
    required this.filePath,
    this.isFullView = false,
    this.contextMenuBuilder,
  });

  @override
  State<TextThumbnailView> createState() => _TextThumbnailViewState();
}

class _TextThumbnailViewState extends State<TextThumbnailView> {
  String? _content;

  @override
  void initState() {
    super.initState();
    _loadSnippet();
  }

  @override
  void didUpdateWidget(TextThumbnailView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.filePath != oldWidget.filePath) {
      _loadSnippet();
    }
  }

  Future<void> _loadSnippet() async {
    final file = File(widget.filePath);
    try {
      if (!await file.exists()) {
        return;
      }
      final stream = file.openRead(0, 16 * 1024);
      final bytes = await stream.fold<List<int>>(
        <int>[],
        (previous, element) => previous..addAll(element),
      );
      final text = utf8.decode(bytes, allowMalformed: true);
      if (mounted) {
        setState(() {
          _content = text;
        });
      }
    } catch (_) {
      // Ignored: fallback or empty content will be shown
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = _content;
    if (text == null) {
      return const SizedBox.shrink();
    }

    if (widget.isFullView) {
      return SelectableText(
        text,
        style: Theme.of(context).textTheme.bodySmall,
        contextMenuBuilder: widget.contextMenuBuilder,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 44.0,
      ),
      child: Text(
        text,
        maxLines: 14,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 12.0,
          fontVariations: <FontVariation>[FontVariation.weight(400)],
        ),
      ),
    );
  }
}
