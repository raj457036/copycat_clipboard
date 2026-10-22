import 'dart:async' show Completer, TimeoutException;
import 'dart:convert' show utf8;

import 'package:crypto/crypto.dart' show sha256;

import 'package:clipboard/base/background/file_ops_worker.dart';
import 'package:clipboard/base/constants/misc.dart';
import 'package:clipboard/base/constants/strings/strings.dart';
import 'package:clipboard/base/data/services/clipboard/clip_hash_registry.dart';
import 'package:clipboard/base/data/services/clipboard/clip_models.dart';
import 'package:clipboard/base/domain/services/analysis/text_analysis.dart';
import 'package:clipboard/base/enums/clip_type.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' as service;
import 'package:mime/mime.dart' as mime;
import 'package:path/path.dart' as p;
import 'package:super_clipboard/super_clipboard.dart';
import 'package:universal_io/io.dart';

// Cache-file writer — persists raw bytes / text into the app cache directory.

/// Writes clipboard content to a local cache file and returns
/// `(file, mimeType, sizeInBytes, original file path)`. At least one of [content], [textContent],
/// or [file] must be provided.
Future<(File?, String?, int, String?)> writeToClipboardCacheFile({
  required String folder,
  required String ext,
  String? fileName,
  Uint8List? content,
  String? textContent,
  File? file,
}) async {
  assert(
    !(file == null && content == null && textContent == null),
    "Provide at least one of content, textContent or file",
  );

  final appDirPath = await getPersistedRootDirPath();
  final directory = p.join(appDirPath, folder);
  await createDirectoryIfNotExists(directory);
  final path = p.join(directory, "${getId()}_${fileName ?? ''}.$ext");
  final file_ = File(path);

  if (file != null) {
    await copyFileInBackground(
      file.uri.toFilePath(windows: Platform.isWindows),
      path,
    );
    return (
      file_,
      mime.lookupMimeType(file.path),
      await file.length(),
      file.path,
    );
  } else if (textContent != null) {
    await file_.writeAsString(textContent);
    return (file_, "text/plain", textContent.length, file_.path);
  } else if (content != null) {
    await file_.writeAsBytes(content, flush: true);
    return (
      file_,
      mime.lookupMimeType(path, headerBytes: content.sublist(0, 100)),
      content.length,
      file_.path,
    );
  }
  return (null, null, 0, null);
}

typedef _FileReadResult = ({
  String? fileName,
  String? fileExtension,
  Uint8List? bytes,
  String? contentHash,
});

/// Processes clipboard format data into a [ClipItem].
/// Handles text, images, URIs, and generic file formats with automatic extension resolution.
class ClipboardFormatProcessor {
  late final Map<DataFormat, Future<ClipItem?> Function(DataReader)> _handlers =
      <DataFormat, Future<ClipItem?> Function(DataReader)>{
        Formats.htmlText: _getHtml,
        Formats.plainText: _getPlainText,
        Formats.plainTextFile: _getPlainTextFile,
        Formats.fileUri: processUri,
        Formats.uri: processUri,
        for (final entry in _imageFormatExtensions.entries)
          entry.key: (reader) => getImage(reader, entry.value, entry.key),
      };

  static final Map<DataFormat, String> _imageFormatExtensions =
      <DataFormat, String>{
        Formats.png: "png",
        Formats.jpeg: "jpeg",
        Formats.gif: "gif",
        Formats.webp: "webp",
        Formats.bmp: "bmp",
        Formats.heic: "heic",
        Formats.heif: "heif",
        avif: "avif",
        Formats.tiff: "tiff",
        Formats.ico: "ico",
        svg: "svg",
      };

  String cleanText(String text) {
    try {
      return Uri.decodeComponent(cleanUpString(text) ?? '');
    } catch (e) {
      return cleanUpString(text) ?? '';
    }
  }

  String? _normalizeExtension(String? extension) {
    if (extension == null || extension.isEmpty) return null;
    final normalized = extension.startsWith('.')
        ? extension.substring(1)
        : extension;
    if (normalized.isEmpty) return null;
    return normalized.toLowerCase();
  }

  String? _extensionFromMimeType(String? mimeType) {
    if (mimeType == null || mimeType.isEmpty) return null;
    return _normalizeExtension(mime.extensionFromMime(mimeType));
  }

  String? _mimeTypeFromFormat(DataFormat format) {
    if (format is SimpleFileFormat) {
      final mimeTypes = format.mimeTypes;
      if (mimeTypes != null && mimeTypes.isNotEmpty) {
        return mimeTypes.first;
      }
    }
    return null;
  }

  String _extensionForFormat(
    DataFormat format, {
    String? fileNameExtension,
    String? preferredMimeType,
  }) {
    return _normalizeExtension(fileNameExtension) ??
        _imageFormatExtensions[format] ??
        _extensionFromMimeType(preferredMimeType) ??
        _extensionFromMimeType(_mimeTypeFromFormat(format)) ??
        "bin";
  }

  Future<T?> readValue<T extends Object>(
    DataReader reader,
    ValueFormat<T> format,
  ) async {
    final canProvide = reader.canProvide(format);
    if (!canProvide) return null;
    final completer = Completer<T?>();
    reader.getValue<T>(
      format,
      (value) => completer.complete(value),
      onError: (error) => completer.completeError(error),
    );
    return completer.future;
  }

  Future<String> _hashStream(Stream<List<int>> stream) async =>
      (await stream.transform(sha256).first).toString();

  Future<_FileReadResult> _readFile(
    DataReader reader,
    FileFormat format, {
    bool virtual = true,
  }) async {
    Uint8List? bytes;
    String? fileName;
    String? fileExtension;
    String? contentHash;
    final c = Completer<void>();
    final progress = reader.getFile(
      format,
      (file) async {
        try {
          final sourceFileName = file.fileName;
          if (sourceFileName != null && sourceFileName.isNotEmpty) {
            fileName = p.basenameWithoutExtension(sourceFileName);
            fileExtension = _normalizeExtension(p.extension(sourceFileName));
          }

          final chunks = <Uint8List>[];
          await for (final chunk in file.getStream()) {
            chunks.add(chunk);
          }
          // Providers can hand back empty data (e.g. right after screen
          // unlock); treat that as unreadable instead of an empty file clip.
          if (chunks.every((c) => c.isEmpty)) {
            c.complete();
            return;
          }
          final resolvedHash = sha256
              .convert(chunks.expand((c) => c).toList())
              .toString();

          if (ClipHashRegistry.instance.isDuplicate(resolvedHash)) {
            contentHash = resolvedHash;
            c.complete();
            return;
          }

          contentHash = resolvedHash;

          final totalLength = chunks.fold(0, (sum, c) => sum + c.length);
          final buffer = Uint8List(totalLength);
          var offset = 0;
          for (final chunk in chunks) {
            buffer.setRange(offset, offset + chunk.length, chunk);
            offset += chunk.length;
          }
          bytes = buffer;
          c.complete();
        } catch (e) {
          c.completeError(e);
        }
      },
      onError: (e) => c.completeError(e),
      allowVirtualFiles: virtual,
    );
    if (progress == null) c.complete();
    await c.future;
    return (
      fileName: fileName,
      fileExtension: fileExtension,
      bytes: bytes,
      contentHash: contentHash,
    );
  }

  Future<ClipItem?> _getHtml(DataReader reader) async {
    String? text;

    try {
      text = await readValue(reader, Formats.htmlText);
    } catch (e) {
      final data = await service.Clipboard.getData("text/html");
      if (data != null) text = data.text;
    }

    if (text == null) {
      logger.w("Text is null");
      return null;
    }

    return ClipItem.text(text: text, textCategory: TextCategory.struct);
  }

  Future<String?> _readTextWithFallback(
    DataReader reader,
    ValueFormat<String> format,
    String mimeType,
  ) async {
    try {
      return await readValue(reader, format);
    } catch (e) {
      final data = await service.Clipboard.getData(mimeType);
      return data?.text;
    }
  }

  Future<ClipItem?> _createTextFileClip({
    required String text,
    required String extension,
    String? storageFileName,
    String? displayFileName,
    String? contentHash,
  }) async {
    final (
      file,
      mimeType,
      size,
      originalPath,
    ) = await writeToClipboardCacheFile(
      folder: "files",
      ext: extension,
      fileName: storageFileName,
      textContent: text,
    );
    if (file == null) return null;

    final resolvedHash =
        contentHash ?? sha256.convert(utf8.encode(text)).toString();

    return ClipItem.file(
      file: file,
      mimeType: mimeType ?? "application/octet-stream",
      textPreview: text.length > kTextFilePreviewLength
          ? text.substring(0, kTextFilePreviewLength)
          : text,
      fileName: displayFileName,
      fileSize: size,
      originalPathUri: Uri.file(originalPath ?? file.path),
      contentDigest: resolvedHash,
    );
  }

  Future<ClipItem?> _getPlainText(DataReader reader) async {
    final textValue = await _readTextWithFallback(
      reader,
      Formats.plainText,
      "text/plain",
    );

    if (textValue == null) {
      logger.w("Text is null");
      return null;
    }

    // Check if the text is a URI
    final trimmed = textValue.trim();
    final uri = Uri.tryParse(trimmed);
    if (uri != null && supportedUriSchemas.contains(uri.scheme)) {
      final hash = sha256.convert(utf8.encode(trimmed)).toString();
      if (ClipHashRegistry.instance.isDuplicate(hash)) {
        return ClipItem.duplicate(contentDigest: hash);
      }
      return ClipItem.uri(uri: uri);
    }

    final text = cleanText(textValue);
    if (text.trim().isEmpty) return null;

    final (textCategory, parsedText) = TextAnalysis.getTextCategory(text);
    final hash = sha256.convert(utf8.encode(parsedText)).toString();
    if (ClipHashRegistry.instance.isDuplicate(hash)) {
      return ClipItem.duplicate(contentDigest: hash);
    }

    if (text.length > kMaxTextClipLength) {
      logger.w(
        "Text length ${text.length} exceeds max limit of $kMaxTextClipLength, "
        "saving as file clip instead",
      );
      return _createTextFileClip(
        text: text,
        extension: "txt",
        storageFileName: "clipboard_text",
        displayFileName: "clipboard_text.txt",
        contentHash: hash,
      );
    }

    return ClipItem.text(text: parsedText, textCategory: textCategory);
  }

  Future<ClipItem?> _getPlainTextFile(DataReader reader) async {
    final fileData = await _readFile(reader, Formats.plainTextFile);
    final fileName = fileData.fileName;
    final fileBytes = fileData.bytes;

    if (fileBytes == null) {
      if (fileData.contentHash != null) {
        return ClipItem.duplicate(contentDigest: fileData.contentHash);
      }
      logger.w("Text file is null or empty.");
      return null;
    }

    if (fileBytes.isNotEmpty && fileBytes.length <= kMaxTextClipLength) {
      return await _getPlainText(reader);
    }

    final text = cleanText(utf8.decode(fileBytes, allowMalformed: true));
    return _createTextFileClip(
      text: text,
      extension: "txt",
      storageFileName: fileName,
      displayFileName: fileName,
      contentHash: fileData.contentHash,
    );
  }

  Future<ClipItem?> getImage(
    DataReader reader,
    String ext,
    DataFormat format,
  ) async {
    return _getFileFormatClip(
      reader,
      format: format as FileFormat,
      preferredExtension: ext,
      preferredMimeType: _mimeTypeFromFormat(format),
      folder: "medias",
      type: ClipItemType.media,
    );
  }

  Future<ClipItem?> _getFileFormatClip(
    DataReader reader, {
    required FileFormat format,
    String? preferredExtension,
    String? preferredMimeType,
    required String folder,
    required ClipItemType type,
  }) async {
    try {
      ({
        String? fileName,
        String? fileExtension,
        Uint8List? bytes,
        String? contentHash,
      })
      result;
      final tryVirtualFirst = Platform.isWindows;
      try {
        result = await _readFile(
          reader,
          format,
          virtual: tryVirtualFirst,
        ).timeout(const Duration(seconds: 3));
      } on TimeoutException catch (e) {
        logger.e(e);
        result = await _readFile(
          reader,
          format,
          virtual: !tryVirtualFirst,
        ).timeout(const Duration(seconds: 10));
      } catch (e) {
        logger.e(e);
        return null;
      }

      final fileName = result.fileName;
      final binary = result.bytes;
      if (binary == null) {
        if (result.contentHash != null) {
          return ClipItem.duplicate(contentDigest: result.contentHash);
        }
        logger.w("Couldn't read content of image file with format $format");
        return null;
      }
      final resolvedExtension = _extensionForFormat(
        format,
        fileNameExtension: result.fileExtension ?? preferredExtension,
        preferredMimeType: preferredMimeType,
      );
      final (
        file,
        mimeType,
        size,
        originalPath,
      ) = await writeToClipboardCacheFile(
        folder: folder,
        ext: resolvedExtension,
        fileName: fileName,
        content: binary,
      );
      if (file == null) return null;
      final resolvedMimeType =
          mimeType ?? preferredMimeType ?? _mimeTypeFromFormat(format);
      if (type == ClipItemType.media) {
        return ClipItem.mediaFile(
          file: file,
          mimeType: resolvedMimeType ?? "application/octet-stream",
          fileName: fileName,
          fileSize: size,
          originalPathUri: Uri.file(originalPath ?? file.path),
          contentDigest: result.contentHash,
        );
      }

      return ClipItem.file(
        file: file,
        mimeType: resolvedMimeType ?? "application/octet-stream",
        fileName: fileName,
        fileSize: size,
        originalPathUri: Uri.file(originalPath ?? file.path),
        contentDigest: result.contentHash,
      );
    } catch (e) {
      return null;
    }
  }

  Future<ClipItem?> _getGenericFile(
    DataReader reader,
    FileFormat format,
  ) async {
    return _getFileFormatClip(
      reader,
      format: format,
      preferredMimeType: _mimeTypeFromFormat(format),
      folder: "files",
      type: ClipItemType.file,
    );
  }

  Future<ClipItem?> getFile(DataReader reader, Uri uri) async {
    File file;
    try {
      file = File(uri.toFilePath(windows: Platform.isWindows));
    } catch (e) {
      logger.e(e);
      return null;
    }

    if (!await file.exists()) {
      logger.w("Couldn't find copied file");
      return null;
    }

    final hash = await _hashStream(file.openRead());
    if (ClipHashRegistry.instance.isDuplicate(hash)) {
      return ClipItem.duplicate(contentDigest: hash);
    }

    final ext = p.extension(file.path).substring(1);
    final fileName = p.basenameWithoutExtension(file.path);
    final (
      cacheFile,
      mimeType,
      size,
      originalPath,
    ) = await writeToClipboardCacheFile(
      folder: "files",
      ext: ext,
      file: file,
      fileName: fileName,
    );
    if (cacheFile == null) return null;

    return ClipItem.file(
      file: cacheFile,
      mimeType: mimeType ?? "application/octet-stream",
      fileName: fileName,
      fileSize: size,
      originalPathUri: Uri.file(originalPath ?? file.path),
      contentDigest: hash,
    );
  }

  Future<ClipItem> getUrl(DataReader reader, NamedUri uri) async {
    final schema = uri.uri.scheme;
    if (supportedUriSchemas.contains(schema)) {
      return ClipItem.uri(uri: uri.uri);
    }
    logger.w("Unsupported uri schema: $schema. Converting to text.");
    return ClipItem.text(text: cleanText(uri.uri.toString()));
  }

  Future<ClipItem?> processUri(DataReader reader) async {
    final fileUriFuture = readValue(reader, Formats.fileUri);
    final uriFuture = readValue(reader, Formats.uri);

    final fileUri = await fileUriFuture;
    if (fileUri != null) return await getFile(reader, fileUri);

    NamedUri? uri;
    try {
      uri = await uriFuture;
    } catch (e) {
      return await _getPlainText(reader);
    }

    if (uri != null) {
      final urlStr = uri.uri.toString().trim();
      final hash = sha256.convert(utf8.encode(urlStr)).toString();
      if (ClipHashRegistry.instance.isDuplicate(hash)) {
        return ClipItem.duplicate(contentDigest: hash);
      }
      return await getUrl(reader, uri);
    }

    return await _getPlainText(reader);
  }

  Future<ClipItem?> process(DataReader reader, DataFormat format) async {
    final handler = _handlers[format];
    if (handler != null) {
      return await handler(reader);
    }

    if (format is FileFormat) {
      return await _getGenericFile(reader, format);
    }

    logger.w(() => "[FormatProcessor] Unsupported clipboard format: $format");
    return null;
  }
}
