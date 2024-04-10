import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:super_clipboard/super_clipboard.dart';

// Custom Formats
// Images

Future<EncodedData?> getFormatForClipboardItem(ClipboardItem item,
    [bool copyFileContent = false]) async {
  switch (item.type) {
    case ClipItemType.text:
    case ClipItemType.url:
      return Formats.plainText(item.value!);
    case ClipItemType.image:
    case ClipItemType.file:
      {
        final isWindow = Platform.isWindows;
        final file = item.getFile();
        if (file == null) return null;

        if (copyFileContent) {
          if (item.fileExtension == ".txt") {
            final content = await file.readAsString();
            return Formats.plainText(content);
          }
        }
        return Formats.fileUri(Uri.file(file.path, windows: isWindow));
      }
    default:
  }
  return null;
}

Future<Uint8List?> readFile(
    ClipboardDataReader reader, FileFormat format) async {
  final c = Completer<Uint8List?>();
  final progress = reader.getFile(format, (file) async {
    try {
      final all = await file.readAll();
      c.complete(all);
    } catch (e) {
      c.completeError(e);
    }
  }, onError: (e) {
    c.completeError(e);
  });
  if (progress == null) {
    c.complete(null);
  }
  return await c.future;
}

Future<void> createDirectoryIfNotExists(String path) async {
  final dir = Directory(path);
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }
}

Future<String?> writeImageFile(
    ClipboardDataReader reader, FileFormat format) async {
  final ext = switch (format) {
    Formats.png => "png",
    Formats.jpeg => "jpeg",
    Formats.gif => "gif",
    Formats.tiff => "tiff",
    Formats.webp => "webp",
    Formats.heic => "heic",
    Formats.svg => "svg",
    _ => null,
  };

  if (ext == null) {
    logger.warning("Extension not found for $format");
    return null;
  }
  final appDir = await getApplicationDocumentsDirectory();
  final contents = await readFile(reader, format);
  if (contents == null) {
    logger.warning("Couldn't read content of image file with format $format");
    return null;
  } else {
    final directory = p.join(
      appDir.path,
      "images",
    );

    await createDirectoryIfNotExists(directory);
    final path = p.join(directory, "${getId()}.$ext");
    await File(path).writeAsBytes(contents);
    return path;
  }
}

Future<String?> writeFile(Uri uri) async {
  final file = File(Uri.decodeFull(uri.path));
  if (!await file.exists()) {
    logger.warning("File not found!");
    return null;
  }
  final length = await file.length();
  if (length >= 10 * 1024 * 1024) {
    logger.warning(
        "File too long ${length / 1024 / 1024} MB! Manual paste is required.");
    return null;
  }
  // Only if its <= 10 MB
  final appDir = await getApplicationDocumentsDirectory();
  final ext = p.extension(file.path);
  final directory = p.join(
    appDir.path,
    "files",
  );

  await createDirectoryIfNotExists(directory);
  final path = p.join(directory, "${getId()}$ext");
  await file.copy(path);

  return path;
}

String cleanText(String text) {
  try {
    return Uri.decodeComponent(text);
  } catch (e) {
    return text;
  }
}

Future<ClipboardItem?> processPlainText(
  String userId,
  ClipboardDataReader reader,
) async {
  final text = await reader.readValue(Formats.plainText);
  if (text == null) {
    logger.warning("Text is null");
    return null;
  } else {
    // Sometimes macOS uses CR for line break;
    var sanitized = cleanText(text.replaceAll(RegExp('\r[\n]?'), '\n'));

    return ClipboardItem.fromText(userId, sanitized);
  }
}

Future<ClipboardItem?> processPlainTextFile(
  String userId,
  ClipboardDataReader reader,
) async {
  final appDir = await getApplicationDocumentsDirectory();
  final suggestedName = await reader.getSuggestedName();
  final contents = await readFile(reader, Formats.plainTextFile);
  if (contents == null) {
    logger.warning("Text file content is null");
    return null;
  } else {
    final text = cleanText(utf8.decode(contents, allowMalformed: true));

    if (text.length <= 255) {
      return ClipboardItem.fromText(userId, text);
    }
    final directory = p.join(appDir.path, "texts");
    await createDirectoryIfNotExists(directory);
    final path = p.join(directory, "${getId()}.txt");
    await File(path).writeAsString(text);
    return ClipboardItem.fromFile(
      userId,
      path,
      preview: text.substring(0, 254),
      fileName: suggestedName,
    );
  }
}

Future<ClipboardItem?> processImageFile(
  String userId,
  DataFormat format,
  ClipboardDataReader reader,
) async {
  final suggestedName = await reader.getSuggestedName();
  final path = await writeImageFile(reader, format as SimpleFileFormat);
  if (path == null) {
    logger.warning("Image file couldn't be created.");
    return null;
  } else {
    return ClipboardItem.fromFile(
      userId,
      path,
      isImage: true,
      fileName: suggestedName,
    );
  }
}

Future<ClipboardItem?> processUri(
  String userId,
  ClipboardDataReader reader,
) async {
  // Make sure to request both values before awaiting
  final fileUriFuture = reader.readValue(Formats.fileUri);
  final uriFuture = reader.readValue(Formats.uri);

  // try file first and if it fails try regular URI
  final fileUri = await fileUriFuture;
  if (fileUri != null) {
    {
      final suggestedName = await reader.getSuggestedName();
      final path = await writeFile(fileUri);
      if (path == null) {
        logger.warning("File couldn't be created.");
        return null;
      }

      logger.info("FileUri: $fileUri");
      return ClipboardItem.fromFile(
        userId,
        path,
        fileName: suggestedName,
      );
    }
  }
  final uri = await uriFuture;
  if (uri != null) {
    logger.info("Uri: ${uri.uri} Name: ${uri.name}");
    return ClipboardItem.fromURL(userId, uri.uri);
  }
  logger.warning("Invalid uri found! falling back to text");
  return processPlainText(userId, reader);
}

Future<ClipboardItem?> getClipboardItemForFormat(
  String userId,
  DataFormat format,
  ClipboardDataReader reader,
) async {
  logger.info("Parsing format: $format");
  switch (format) {
    case Formats.plainText:
      return processPlainText(userId, reader);
    case Formats.plainTextFile:
      return processPlainTextFile(userId, reader);
    case Formats.png:
    case Formats.jpeg:
    case Formats.gif:
    case Formats.tiff:
    case Formats.webp:
    case Formats.heic:
    case Formats.svg:
      return processImageFile(userId, format, reader);
    case Formats.uri:
    case Formats.fileUri:
      return processUri(userId, reader);
    default:
      logger.warning("Not supported: $format");
      return null;
  }
}
