import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:super_clipboard/super_clipboard.dart';

// Custom Formats
// Images

FutureOr<EncodedData>? getFormatForClipboardItem(ClipboardItem item) {
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
    _ => null,
  };
  if (ext == null) return null;
  final appDir = await getApplicationDocumentsDirectory();
  final contents = await readFile(reader, Formats.png);
  if (contents == null) {
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

Future<ClipboardItem?> getClipboardItemForFormat(
  DataFormat format,
  ClipboardDataReader reader,
) async {
  logger.info("Parsing clipboard contents");
  switch (format) {
    case Formats.plainText:
      final text = await reader.readValue(Formats.plainText);
      if (text == null) {
        return null;
      } else {
        // Sometimes macOS uses CR for line break;
        final sanitized = text.replaceAll(RegExp('\r[\n]?'), '\n');
        return ClipboardItem.fromText(sanitized);
      }
    case Formats.plainTextFile:
      final appDir = await getApplicationDocumentsDirectory();
      final contents = await readFile(reader, Formats.plainTextFile);
      if (contents == null) {
        return null;
      } else {
        final text = utf8.decode(contents, allowMalformed: true);

        if (text.length <= 255) {
          return ClipboardItem.fromText(text);
        }
        final directory = p.join(appDir.path, "texts");
        await createDirectoryIfNotExists(directory);
        final path = p.join(directory, "${getId()}.txt");
        await File(path).writeAsString(text);
        return ClipboardItem.fromFile(path, preview: text.substring(0, 50));
      }
    case Formats.htmlText:
      //? Unsupported format
      return null;
    // final html = await reader.readValue(Formats.htmlText);
    // if (html == null) {
    //   return null;
    // } else {
    //   return _RepresentationWidget(
    //     format: format,
    //     name: 'HTML Text',
    //     synthesized: reader.isSynthesized(format),
    //     virtual: reader.isVirtual(format),
    //     content: Text(html),
    //   );
    // }
    case Formats.png:
    case Formats.jpeg:
    case Formats.gif:
    case Formats.tiff:
    case Formats.webp:
    case Formats.heic:
    case Formats.svg:
      final path = await writeImageFile(reader, format as SimpleFileFormat);
      if (path == null) {
        return null;
      } else {
        return ClipboardItem.fromFile(path, isImage: true);
      }
    case Formats.uri:
    case Formats.fileUri:
      // Make sure to request both values before awaiting
      final fileUriFuture = reader.readValue(Formats.fileUri);
      final uriFuture = reader.readValue(Formats.uri);

      // try file first and if it fails try regular URI
      final fileUri = await fileUriFuture;
      if (fileUri != null) {
        {
          final path = await writeFile(fileUri);
          if (path == null) return null;

          logger.info("FileUri: $fileUri");
          return ClipboardItem.fromFile(path);
        }
      }
      final uri = await uriFuture;
      if (uri != null) {
        logger.info("Uri: ${uri.uri} Name: ${uri.name}");
        return ClipboardItem.fromUri(uri.uri);
      }
      return null;
    // case formatCustom:
    //   final data = await reader.readValue(formatCustom);
    //   if (data == null) {
    //     return null;
    //   } else {
    //     return _RepresentationWidget(
    //       format: format,
    //       name: 'Custom Data',
    //       synthesized: reader.isSynthesized(formatCustom),
    //       virtual: reader.isVirtual(formatCustom),
    //       content: Text(data.toString()),
    //     );
    //   }
    default:
      return null;
  }
}
