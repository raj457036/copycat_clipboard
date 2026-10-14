import 'dart:io';

import 'package:file_thumbnailer/models/thumbnail_request.dart';
import 'package:file_thumbnailer/services/thumbnail_service.dart';
import 'package:file_thumbnailer/widgets/file_icon_mapper.dart';
import 'package:file_thumbnailer/widgets/text_thumbnail_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class FileThumbnail extends StatefulWidget {
  final ThumbnailRequest request;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BoxFit fit;
  final Alignment alignment;
  final bool showVideoBadge;
  final EditableTextContextMenuBuilder? contextMenuBuilder;

  const FileThumbnail({
    super.key,
    required this.request,
    this.placeholder,
    this.errorWidget,
    this.fit = BoxFit.fitWidth,
    this.alignment = Alignment.topCenter,
    this.showVideoBadge = false,
    this.contextMenuBuilder,
  });

  FileThumbnail.fromPath({
    super.key,
    required String filePath,
    required double widgetSize,
    String? mimeType,
    int? fileSize,
    String? modifier,
    this.placeholder,
    this.errorWidget,
    this.fit = BoxFit.fitWidth,
    this.alignment = Alignment.topCenter,
    this.showVideoBadge = false,
    this.contextMenuBuilder,
  }) : request = ThumbnailRequest(
         filePath: filePath,
         widgetSize: widgetSize,
         mimeType: mimeType,
         fileSize: fileSize,
         modifier: modifier,
       );

  @override
  State<FileThumbnail> createState() => _FileThumbnailState();
}

class _FileThumbnailState extends State<FileThumbnail> {
  File? _imageFile;
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _resolveThumbnail();
  }

  @override
  void didUpdateWidget(FileThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.request != oldWidget.request) {
      _resolveThumbnail();
    }
  }

  void _resolveThumbnail() {
    final service = ThumbnailService.instance;
    if (!service.canGenerateImageThumbnail(widget.request)) {
      _imageFile = null;
      _isLoading = false;
      _hasError = false;
      return;
    }

    final syncHit = service.getCachedThumbnailSync(widget.request);
    if (syncHit != null) {
      _imageFile = syncHit;
      _isLoading = false;
      _hasError = false;
      return;
    }

    _imageFile = null;
    _isLoading = true;
    _hasError = false;

    service
        .getOrGenerateThumbnail(widget.request)
        .then((file) {
          if (!mounted) return;
          setState(() {
            _imageFile = file;
            _isLoading = false;
            _hasError = file == null;
          });
        })
        .catchError((_) {
          if (!mounted) return;
          setState(() {
            _imageFile = null;
            _isLoading = false;
            _hasError = true;
          });
        });
  }

  bool _isTextFile() {
    final mime = widget.request.mimeType?.toLowerCase();
    final ext = p.extension(widget.request.filePath).toLowerCase();
    if (mime != null && mime.startsWith('text/')) {
      return true;
    }
    return const <String>{
      '.txt',
      '.md',
      '.dart',
      '.py',
      '.js',
      '.ts',
      '.json',
      '.yaml',
      '.yml',
      '.xml',
      '.html',
      '.css',
      '.log',
    }.contains(ext);
  }

  bool _isVideoFile() {
    final mime = widget.request.mimeType?.toLowerCase();
    final ext = p.extension(widget.request.filePath).toLowerCase();
    return (mime != null && mime.startsWith('video/')) ||
        const <String>{
          '.mp4',
          '.mov',
          '.mkv',
          '.avi',
          '.webm',
          '.flv',
          '.wmv',
          '.m4v',
        }.contains(ext);
  }

  Widget _buildIcon(BuildContext context) {
    final theme = Theme.of(context);
    final iconData = FileIconMapper.getIcon(
      mimeType: widget.request.mimeType,
      filePath: widget.request.filePath,
    );
    return Center(
      child: Icon(
        iconData,
        size: widget.request.widgetSize * 0.35,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_imageFile != null) {
      final imageWidget = Image.file(
        _imageFile!,
        fit: widget.fit,
        width: widget.request.widgetSize,
        gaplessPlayback: true,
        errorBuilder: (context, error, stackTrace) =>
            widget.errorWidget ?? _buildIcon(context),
      );

      Widget content = FittedBox(
        fit: widget.fit,
        alignment: widget.alignment,
        child: imageWidget,
      );

      if (widget.showVideoBadge && _isVideoFile()) {
        content = Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: content),
            const Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        );
      }

      return content;
    }

    if (_isTextFile()) {
      final isFullView =
          widget.request.modifier?.endsWith('full_view') ?? false;
      return TextThumbnailView(
        filePath: widget.request.filePath,
        isFullView: isFullView,
        contextMenuBuilder: widget.contextMenuBuilder,
      );
    }

    if (_isLoading) {
      return widget.placeholder ?? _buildIcon(context);
    }

    if (_hasError && widget.errorWidget != null) {
      return widget.errorWidget!;
    }

    return _buildIcon(context);
  }
}
