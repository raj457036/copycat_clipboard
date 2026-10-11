import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart';
import 'package:clipboard/base/constants/widget_styles.dart';
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard/widgets/image_not_found.dart';
import 'package:clipboard/widgets/link_preview/favicon.dart';
import 'package:clipboard/widgets/link_preview/fetcher.dart';
import 'package:clipboard/widgets/link_preview/type.dart';
import 'package:clipboard/widgets/shimmer.dart' show Shimmer;
import 'package:clipboard/widgets/yarn_ball_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _LinkPreviewItem extends StatelessWidget {
  const _LinkPreviewItem({
    this.maxTitleLines = 1,
    this.maxDescLines = 1,
    this.bottom,
    this.onTap,
    this.title,
    this.description,
    this.provider,
    required this.originalUrl,
    required this.imageBoxFit,
  });

  final String originalUrl;
  final BoxFit imageBoxFit;
  final int maxTitleLines;
  final int maxDescLines;
  final Widget? bottom;
  final VoidCallback? onTap;
  final String? title;
  final String? description;
  final ImageProvider<Object>? provider;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final body = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: padding2,
      children: [
        if (provider != null)
          Expanded(
            child: _LinkPreviewImage(
              provider: provider!,
              imageBoxFit: imageBoxFit,
            ),
          )
        else
          const Expanded(child: ImageNotFound()),
        height4,
        if (title != null && title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Favicon(
                  url: originalUrl,
                  padding: const EdgeInsets.only(right: padding4),
                ),
                Expanded(
                  child: Text(
                    title!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: maxTitleLines,
                    style: context.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        if (description != null && description!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding8),
            child: Text(
              description!,
              overflow: TextOverflow.ellipsis,
              maxLines: maxDescLines,
              style: context.textTheme.bodySmall?.copyWith(
                color: colors.outline,
              ),
            ),
          ),
        if (bottom != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding8),
            child: bottom,
          ),
        height8,
      ],
    );

    if (onTap != null) {
      return InkWell(
        mouseCursor: SystemMouseCursors.click,
        borderRadius: radius8,
        onTap: onTap,
        child: body,
      );
    }
    return Ink(color: colors.surface, child: body);
  }
}

class _LinkPreviewImage extends StatelessWidget {
  final BoxFit imageBoxFit;
  final ImageProvider<Object> provider;
  const _LinkPreviewImage({required this.provider, required this.imageBoxFit});

  @override
  Widget build(BuildContext context) {
    if (provider case final NetworkImage networkImage) {
      return _buildNetwork(networkImage);
    }

    return _buildGeneric();
  }

  Widget _buildNetwork(NetworkImage networkImage) {
    final url = networkImage.url;

    if (url.endsWith('giphy.gif?raw=true')) {
      return const ImageNotFound();
    }

    if (url.contains('.svg')) {
      return SvgPicture.network(
        url,
        fit: BoxFit.contain,
        headers: networkImage.headers,
        placeholderBuilder: (context) => const Center(child: YarnBallLoading()),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: imageBoxFit,
      errorWidget: (context, error, stackTrace) => const ImageNotFound(),
    );
  }

  Widget _buildGeneric() {
    return Image(
      image: provider,
      fit: imageBoxFit,
      errorBuilder: (context, error, stackTrace) => const ImageNotFound(),
    );
  }
}

class LinkPreview extends StatefulWidget {
  final ClipboardItem item;

  final int maxTitleLines;
  final int maxDescLines;
  final VoidCallback? onTap;
  final Widget? bottom;
  final BoxFit? imageBoxFit;

  const LinkPreview({
    super.key,
    required this.item,
    this.maxTitleLines = 2,
    this.maxDescLines = 4,
    this.onTap,
    this.bottom,
    this.imageBoxFit,
  });

  @override
  State<LinkPreview> createState() => _LinkPreviewState();
}

class _LinkPreviewState extends State<LinkPreview> {
  static final Set<String> _sessionTransientErrors = {};
  static final Map<String, Future<LinkPreviewFetchResult>> _inFlightFetches =
      {};

  LinkPreviewData? _preview;
  bool _isLoading = false;
  Timer? _debounceTimer;

  String get _url => widget.item.url?.trim() ?? '';

  @override
  void initState() {
    super.initState();
    _hydrateFromItem();
    _fetchPreviewIfNeeded();
  }

  @override
  void didUpdateWidget(covariant LinkPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldUrl = oldWidget.item.url?.trim() ?? '';
    final newUrl = widget.item.url?.trim() ?? '';

    if (oldUrl != newUrl) {
      _hydrateFromItem();
      _fetchPreviewIfNeeded();
      return;
    }

    final previewChanged =
        oldWidget.item.linkPreviewTitle != widget.item.linkPreviewTitle ||
        oldWidget.item.linkPreviewDescription !=
            widget.item.linkPreviewDescription ||
        oldWidget.item.linkPreviewImageUrl != widget.item.linkPreviewImageUrl;
    if (previewChanged) {
      _hydrateFromItem();
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _hydrateFromItem() {
    _preview = _previewFromItem(widget.item);
    _isLoading = false;
  }

  void _fetchPreviewIfNeeded() {
    if (_preview == null) {
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 250), () {
        if (mounted && _preview == null) {
          _fetchPreview();
        }
      });
    }
  }

  Future<void> _fetchPreview() async {
    final String url = _url;
    if (url.isEmpty || !_isValidUrl(url)) {
      logger.w('Invalid URL for link preview: $url');
      return;
    }

    if (_sessionTransientErrors.contains(url)) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      return;
    }

    if (mounted) {
      setState(() {
        _preview = null;
        _isLoading = true;
      });
    }

    Future<LinkPreviewFetchResult>? fetch = _inFlightFetches[url];
    final bool startedFetch = fetch == null;
    if (startedFetch) {
      logger.d('Fetching link preview for: $url');
      fetch = getLinkPreviewData(LinkPreviewFetchRequest(url: url));
      _inFlightFetches[url] = fetch;
    }

    final OfflinePersistenceCubit persistenceCubit = context
        .read<OfflinePersistenceCubit>();

    final LinkPreviewFetchResult result = await fetch;

    if (startedFetch) {
      _inFlightFetches.remove(url);
    }

    logger.d('Fetched link preview for: $url, status: ${result.status}');

    if (result.status == LinkPreviewFetchStatus.success) {
      final LinkPreviewData data = result.toLinkPreviewData();

      if (startedFetch) {
        await persistenceCubit.persistLocalLinkPreview(
          widget.item,
          title: data.title,
          description: data.description,
          imageUrl: data.image?.imageUrl,
        );
      }

      if (mounted) {
        setState(() {
          _preview = data;
          _isLoading = false;
        });
      }
    } else if (result.status == LinkPreviewFetchStatus.noMetadata) {
      final LinkPreviewData emptyData = LinkPreviewData(link: url, title: '');

      if (startedFetch) {
        await persistenceCubit.persistLocalLinkPreview(widget.item, title: '');
      }

      if (mounted) {
        setState(() {
          _preview = emptyData;
          _isLoading = false;
        });
      }
    } else {
      _sessionTransientErrors.add(url);

      if (mounted) {
        setState(() {
          _preview = null;
          _isLoading = false;
        });
      }
    }
  }

  LinkPreviewData? _previewFromItem(ClipboardItem item) {
    final String? title = item.linkPreviewTitle?.trim();
    final String? description = item.linkPreviewDescription?.trim();
    final String? imageUrl = item.linkPreviewImageUrl?.trim();

    final bool hasBeenFetched =
        item.linkPreviewTitle != null ||
        item.linkPreviewDescription != null ||
        item.linkPreviewImageUrl != null;

    if (!hasBeenFetched) {
      return null;
    }

    return LinkPreviewData(
      link: item.url ?? '',
      title: title,
      description: description,
      image: imageUrl != null
          ? LinkImagePreviewData(imageUrl: imageUrl, imageSize: Size.zero)
          : null,
    );
  }

  bool _isValidUrl(String url) {
    if (url.isEmpty) {
      return false;
    }

    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      if (widget.bottom == null) return const Shimmer();
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Expanded(child: Shimmer()),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: padding8,
              vertical: padding10,
            ),
            child: widget.bottom!,
          ),
        ],
      );
    }

    if (_preview == null) {
      return _LinkPreviewItem(
        bottom: widget.bottom,
        onTap: widget.onTap,
        originalUrl: _url,
        imageBoxFit: widget.imageBoxFit ?? BoxFit.cover,
      );
    }

    return _LinkPreviewItem(
      maxTitleLines: widget.maxTitleLines,
      maxDescLines: widget.maxDescLines,
      bottom: widget.bottom,
      onTap: widget.onTap,
      title: _preview?.title,
      description: _preview?.description,
      originalUrl: _url,
      provider: _preview?.image == null
          ? null
          : CachedNetworkImageProvider(_preview!.image!.imageUrl),
      imageBoxFit: widget.imageBoxFit ?? BoxFit.cover,
    );
  }
}
