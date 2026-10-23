import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'dart:typed_data';

import 'package:clipboard/utils/semaphore.dart';
import 'package:clipboard/widgets/link_preview/type.dart';
import 'package:flutter/foundation.dart';
import 'package:html/dom.dart' show Document, Element;
import 'package:html/parser.dart' as parser show parse;
import 'package:http/http.dart' as http show Request, Client, StreamedResponse;
import 'package:punycode/punycode.dart' as puny;

String _calculateUrl(String baseUrl, String? proxy) {
  String urlToReturn = baseUrl;

  final RegExp domainRegex = RegExp(r'^(?:(http|https|ftp):\/\/)?([^\/?#]+)');
  final RegExpMatch? match = domainRegex.firstMatch(baseUrl);

  if (match != null) {
    final String originalDomain = match.group(2)!;

    final List<String> labels = originalDomain.split('.');
    if (labels.length <= 10) {
      final List<String> encodedLabels = labels.map((String label) {
        final bool isAscii = label.runes.every((int r) => r < 128);
        return isAscii ? label : 'xn--${puny.punycodeEncode(label)}';
      }).toList();

      final String punycodedDomain = encodedLabels.join('.');
      urlToReturn = baseUrl.replaceFirst(originalDomain, punycodedDomain);
    }
  }

  if (proxy != null) {
    return '$proxy$urlToReturn';
  }

  return urlToReturn;
}

String? _getMetaContent(Document document, String propertyValue) {
  final List<Element> meta = document.getElementsByTagName('meta');
  final Element element = meta.firstWhere(
    (Element e) => e.attributes['property'] == propertyValue,
    orElse: () => meta.firstWhere(
      (Element e) => e.attributes['name'] == propertyValue,
      orElse: () => Element.tag(null),
    ),
  );

  return element.attributes['content']?.trim();
}

String? _getTitle(Document document) {
  final String? metaTitle =
      _getMetaContent(document, 'og:title') ??
      _getMetaContent(document, 'twitter:title') ??
      _getMetaContent(document, 'og:site_name');

  if (metaTitle != null && metaTitle.isNotEmpty) return metaTitle;

  final List<Element> titleElements = document.getElementsByTagName('title');
  if (titleElements.isNotEmpty) return titleElements.last.text.trim();
  return null;
}

String? _getDescription(Document document) =>
    _getMetaContent(document, 'og:description') ??
    _getMetaContent(document, 'description') ??
    _getMetaContent(document, 'twitter:description');

List<String> _getImageUrls(Document document, String baseUrl) {
  final List<Element> meta = document.getElementsByTagName('meta');
  final List<Element> elements = meta
      .where(
        (Element e) =>
            e.attributes['property'] == 'og:image' ||
            e.attributes['property'] == 'twitter:image' ||
            e.attributes['name'] == 'og:image' ||
            e.attributes['name'] == 'twitter:image',
      )
      .toList();

  final List<String> urls = <String>[];
  for (final Element element in elements) {
    final String? content = element.attributes['content']?.trim();
    final String? actual = _getActualImageUrl(baseUrl, content);
    if (actual != null && actual.isNotEmpty) {
      urls.add(actual);
    }
  }

  if (urls.isEmpty) {
    final List<Element> links = document.getElementsByTagName('link');
    for (final Element link in links) {
      final String? rel = link.attributes['rel']?.toLowerCase();
      if (rel == 'image_src' || rel == 'apple-touch-icon') {
        final String? href = link.attributes['href']?.trim();
        final String? actual = _getActualImageUrl(baseUrl, href);
        if (actual != null && actual.isNotEmpty) {
          urls.add(actual);
          break;
        }
      }
    }
  }

  return urls;
}

String? _getActualImageUrl(String baseUrl, String? imageUrl) {
  if (imageUrl == null || imageUrl.isEmpty || imageUrl.startsWith('data')) {
    return null;
  }

  if (imageUrl.contains('.svg') || imageUrl.contains('.gif')) return null;

  String resolved = imageUrl;
  if (resolved.startsWith('//')) {
    resolved = 'https:$resolved';
  }

  if (!resolved.startsWith('http')) {
    if (baseUrl.endsWith('/') && resolved.startsWith('/')) {
      resolved = '${baseUrl.substring(0, baseUrl.length - 1)}$resolved';
    } else if (!baseUrl.endsWith('/') && !resolved.startsWith('/')) {
      resolved = '$baseUrl/$resolved';
    } else {
      resolved = '$baseUrl$resolved';
    }
  }

  return resolved;
}

Future<http.StreamedResponse?> _getRedirectedStreamedResponse(
  Uri uri, {
  Map<String, String>? headers,
  int maxRedirects = 5,
  Duration timeout = const Duration(seconds: 5),
  http.Client? client,
}) async {
  final http.Client httpClient = client ?? http.Client();
  int redirectCount = 0;
  Uri currentUri = uri;

  while (redirectCount < maxRedirects) {
    final http.Request request = http.Request('GET', currentUri)
      ..followRedirects = false;

    if (headers != null) {
      request.headers.addAll(headers);
    }

    final http.StreamedResponse streamedResponse = await httpClient
        .send(request)
        .timeout(timeout);

    if (streamedResponse.isRedirect &&
        streamedResponse.headers.containsKey('location')) {
      final String location = streamedResponse.headers['location']!;
      currentUri = currentUri.resolve(location);
      redirectCount++;
      await streamedResponse.stream.drain<void>();
      continue;
    }

    return streamedResponse;
  }

  return null;
}

const int _maxHeadBytes = 1024 * 1024;

/// Streams `</head` / `<body` detection byte by byte so a match split across
/// chunks is still found, without decoding or copying chunks into strings.
class _HeadEndMatcher {
  static final List<int> _headClose = ascii.encode('</head');
  static final List<int> _bodyOpen = ascii.encode('<body');

  int _headState = 0;
  int _bodyState = 0;

  static int _advance(List<int> pattern, int state, int byte) {
    if (byte == pattern[state]) return state + 1;
    return byte == pattern[0] ? 1 : 0;
  }

  bool feed(List<int> chunk) {
    for (int i = 0; i < chunk.length; i++) {
      int byte = chunk[i];
      if (byte >= 0x41 && byte <= 0x5A) byte |= 0x20;
      _headState = _advance(_headClose, _headState, byte);
      _bodyState = _advance(_bodyOpen, _bodyState, byte);
      if (_headState == _headClose.length || _bodyState == _bodyOpen.length) {
        return true;
      }
    }
    return false;
  }
}

Future<Uint8List> _readHeadBytes(http.StreamedResponse response) async {
  final BytesBuilder builder = BytesBuilder(copy: false);
  final Completer<void> completer = Completer<void>();
  final _HeadEndMatcher matcher = _HeadEndMatcher();
  late final StreamSubscription<List<int>> subscription;
  bool isDone = false;

  void finish() {
    if (!isDone) {
      isDone = true;
      subscription.cancel();
      if (!completer.isCompleted) {
        completer.complete();
      }
    }
  }

  subscription = response.stream.listen(
    (List<int> chunk) {
      if (isDone) return;
      builder.add(chunk);
      if (matcher.feed(chunk) || builder.length >= _maxHeadBytes) {
        finish();
      }
    },
    onError: (Object error, StackTrace stackTrace) {
      if (!isDone) {
        isDone = true;
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.completeError(error, stackTrace);
        }
      }
    },
    onDone: () {
      finish();
    },
    cancelOnError: true,
  );

  await completer.future;
  return builder.takeBytes();
}

Future<LinkPreviewFetchResult> _fetchAndParseInIsolate(
  LinkPreviewFetchRequest request,
) async {
  final http.Client client = http.Client();
  try {
    String url = request.url;
    if (!url.toLowerCase().startsWith('http')) {
      url = 'https://$url';
    }

    final String previewDataUrl = _calculateUrl(url, request.proxy);
    final Uri uri = Uri.parse(previewDataUrl);

    final Map<String, String> effectiveHeaders = <String, String>{
      'User-Agent': request.userAgent,
      ...?request.headers,
    };

    final http.StreamedResponse? streamedResponse =
        await _getRedirectedStreamedResponse(
          uri,
          headers: effectiveHeaders,
          timeout: request.requestTimeout,
          client: client,
        );

    if (streamedResponse == null) {
      return LinkPreviewFetchResult(
        link: previewDataUrl,
        status: LinkPreviewFetchStatus.transientError,
      );
    }

    final int statusCode = streamedResponse.statusCode;
    if (statusCode >= 500) {
      return LinkPreviewFetchResult(
        link: previewDataUrl,
        status: LinkPreviewFetchStatus.transientError,
      );
    }

    if (statusCode == 408 ||
        statusCode == 425 ||
        statusCode == 429 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 407) {
      return LinkPreviewFetchResult(
        link: previewDataUrl,
        status: LinkPreviewFetchStatus.transientError,
      );
    }

    if (statusCode >= 400) {
      return LinkPreviewFetchResult(
        link: previewDataUrl,
        status: LinkPreviewFetchStatus.noMetadata,
      );
    }

    final String finalUrl = previewDataUrl;
    final String contentType =
        streamedResponse.headers['content-type']?.toLowerCase() ?? '';

    if (contentType.startsWith('image/')) {
      return LinkPreviewFetchResult(
        link: finalUrl,
        imageUrl: finalUrl,
        status: LinkPreviewFetchStatus.success,
      );
    }

    final bool isHtml =
        contentType.contains('text/html') ||
        contentType.contains('application/xhtml') ||
        contentType.isEmpty;

    if (!isHtml) {
      return LinkPreviewFetchResult(
        link: finalUrl,
        status: LinkPreviewFetchStatus.noMetadata,
      );
    }

    final Uint8List headBytes = await _readHeadBytes(streamedResponse);
    if (headBytes.isEmpty) {
      return LinkPreviewFetchResult(
        link: finalUrl,
        status: LinkPreviewFetchStatus.transientError,
      );
    }

    Encoding encoding = utf8;
    if (contentType.contains('charset=')) {
      final String charset = contentType
          .split('charset=')[1]
          .split(';')[0]
          .trim();
      encoding = Encoding.getByName(charset) ?? utf8;
    }

    String html;
    try {
      html = encoding.decode(headBytes);
    } catch (_) {
      html = utf8.decode(headBytes, allowMalformed: true);
    }

    final Document document = parser.parse(html);
    final String? title = _getTitle(document);
    final String? description = _getDescription(document);
    final List<String> imageUrls = _getImageUrls(document, finalUrl);

    String? previewDataImageUrl;
    if (imageUrls.isNotEmpty) {
      previewDataImageUrl = _calculateUrl(imageUrls.first, request.proxy);
    }

    final bool hasMetadata =
        (title != null && title.isNotEmpty) ||
        (description != null && description.isNotEmpty) ||
        (previewDataImageUrl != null && previewDataImageUrl.isNotEmpty);

    return LinkPreviewFetchResult(
      link: finalUrl,
      title: title,
      description: description,
      imageUrl: previewDataImageUrl,
      status: hasMetadata
          ? LinkPreviewFetchStatus.success
          : LinkPreviewFetchStatus.noMetadata,
    );
  } on TimeoutException {
    return LinkPreviewFetchResult(
      link: request.url,
      status: LinkPreviewFetchStatus.transientError,
    );
  } catch (_) {
    return LinkPreviewFetchResult(
      link: request.url,
      status: LinkPreviewFetchStatus.transientError,
    );
  } finally {
    client.close();
  }
}

final Semaphore _fetchSemaphore = Semaphore(
  (Platform.numberOfProcessors ~/ 2).clamp(2, 8),
);

Future<LinkPreviewFetchResult> getLinkPreviewData(
  LinkPreviewFetchRequest request,
) async {
  await _fetchSemaphore.acquire();
  try {
    final LinkPreviewFetchResult? result = await compute(
      _fetchAndParseInIsolate,
      request,
    );
    return result ??
        LinkPreviewFetchResult(
          link: request.url,
          status: LinkPreviewFetchStatus.transientError,
        );
  } catch (_) {
    return LinkPreviewFetchResult(
      link: request.url,
      status: LinkPreviewFetchStatus.transientError,
    );
  } finally {
    _fetchSemaphore.release();
  }
}
