import 'dart:async' show Completer;
import 'dart:convert' show utf8;
import 'dart:io' show Directory, File;
import 'dart:typed_data';

import 'package:clipboard/common/logging.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import "package:path/path.dart" as p;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:super_clipboard/super_clipboard.dart';

const _clipTypePriority = [
  Formats.png,
  Formats.jpeg,
  Formats.gif,
  Formats.tiff,
  Formats.webp,
  Formats.heic,
  Formats.svg,
  Formats.fileUri,
  Formats.uri,
  Formats.plainTextFile,
  Formats.plainText,
];

const _supportedUriSchemas = {
  "http",
  "https",
  "ftp",
  "file",
  "mailto",
  "tel",
  "data",
  "ws",
  "wss",
  "ldap",
  "urn",
  "git",
  "ssh",
  "irc",
  "news"
};

class Clip {
  final ClipItemType type;
  final File? file;
  final String? fileName;
  final String? text;
  final String? url;
  final bool isImage;

  Clip({
    required this.type,
    required this.file,
    required this.fileName,
    required this.text,
    required this.url,
    required this.isImage,
  });

  factory Clip.text({
    required String text,
  }) =>
      Clip(
        file: null,
        fileName: null,
        isImage: false,
        url: null,
        text: text,
        type: ClipItemType.text,
      );

  factory Clip.url({
    required String url,
  }) =>
      Clip(
        file: null,
        fileName: null,
        isImage: false,
        url: url,
        text: null,
        type: ClipItemType.url,
      );

  factory Clip.imageFile({
    required File file,
    String? fileName,
  }) =>
      Clip(
        fileName: fileName,
        isImage: true,
        file: file,
        url: null,
        text: null,
        type: ClipItemType.image,
      );

  factory Clip.file({
    required File file,
    String? textPreview,
    String? fileName,
  }) =>
      Clip(
        file: file,
        fileName: fileName,
        isImage: false,
        url: null,
        text: textPreview,
        type: ClipItemType.file,
      );
}

class ClipboardFormatProcessor {
  String cleanText(String text) {
    try {
      return Uri.decodeComponent(text);
    } catch (e) {
      return text;
    }
  }

  Future<(String?, Uint8List?)> readFile(
      ClipboardDataReader reader, FileFormat format) async {
    final c = Completer<(String?, Uint8List?)>();
    final progress = reader.getFile(format, (file) async {
      try {
        final name = file.fileName;
        final all = await file.readAll();
        c.complete((name, all));
      } catch (e) {
        c.completeError(e);
      }
    }, onError: (e) {
      c.completeError(e);
    });
    if (progress == null) {
      c.complete((null, null));
    }
    return await c.future;
  }

  Future<File?> _writeTempFile({
    required String folder,
    required String ext,
    String? fileName,
    Uint8List? content,
    String? textContent,
    File? file,
  }) async {
    assert(
      !(file == null && content == null && textContent == null),
      "Provide atleast one of content, textContent or file",
    );

    final appDir = await getTemporaryDirectory();

    final directory = p.join(appDir.path, folder);
    await createDirectoryIfNotExists(directory);
    final path = p.join(directory, "${getId()}_${fileName ?? ''}.$ext");
    final file_ = File(path);

    if (file != null) {
      await file.copy(path);
      return file_;
    } else if (textContent != null) {
      await file_.writeAsString(textContent);
      return file_;
    } else if (content != null) {
      await file_.writeAsBytes(content);
      return file_;
    }
    return null;
  }

  Future<Clip?> _getPlainText(ClipboardDataReader reader) async {
    final text = await reader.readValue(Formats.plainText);
    if (text == null) {
      logger.warning("Text is null");
      return null;
    } else {
      // Sometimes macOS uses CR for line break;
      var sanitized = cleanText(text.replaceAll(RegExp('\r[\n]?'), '\n'));
      return Clip.text(text: sanitized);
    }
  }

  Future<Clip?> _getPlainTextFile(ClipboardDataReader reader) async {
    final (fileName, binary) = await readFile(reader, Formats.plainTextFile);

    if (binary == null) {
      logger.warning("Text file is null or empty.");
      return null;
    }
    final text = cleanText(utf8.decode(binary, allowMalformed: true));

    // TODO check file name if it ends with anything other then txt or "blank"
    // Todo: then its a file.
    if (text.length <= 1024) {
      return Clip.text(text: text);
    }

    final file = await _writeTempFile(
      folder: "texts",
      ext: "txt",
      fileName: fileName,
      textContent: text,
    );

    if (file == null) {
      logger.warning("Couldn't write text file");
      return null;
    }

    return Clip.file(
      file: file,
      textPreview: text,
      fileName: fileName,
    );
  }

  Future<Clip?> getImage(
    ClipboardDataReader reader,
    String ext,
    DataFormat format,
  ) async {
    final (fileName, binary) = await readFile(
      reader,
      format as FileFormat,
    );

    if (binary == null) {
      logger.warning("Couldn't read content of image file with format $format");
      return null;
    }

    final file = await _writeTempFile(
      folder: "images",
      ext: ext,
      fileName: fileName,
      content: binary,
    );

    if (file == null) {
      logger.warning("Couldn't write image file");
      return null;
    }

    return Clip.imageFile(
      file: file,
      fileName: fileName,
    );
  }

  Future<Clip?> getFile(
    ClipboardDataReader reader,
    Uri uri,
  ) async {
    File file;
    try {
      final filePath = Uri.decodeFull(uri.path);
      file = File(filePath);
    } catch (e) {
      logger.shout(e);
      return null;
    }

    // check if file exists
    final exists = await file.exists();
    if (!exists) {
      logger.warning("Couldn't find file at $uri");
      return null;
    }

    final ext = p.extension(file.path).substring(1);
    final fileName = p.basenameWithoutExtension(file.path);
    final tempFile = await _writeTempFile(
      folder: "files",
      ext: ext,
      file: file,
      fileName: fileName,
    );

    if (tempFile == null) {
      logger.warning("Couldn't write file");
      return null;
    }

    return Clip.file(
      file: tempFile,
      fileName: fileName,
    );
  }

  Future<Clip> getUrl(ClipboardDataReader reader, NamedUri uri) async {
    final schema = uri.uri.scheme;
    final isSupported = _supportedUriSchemas.contains(schema);
    if (isSupported) {
      return Clip.url(url: uri.uri.toString());
    } else {
      logger.warning("Unsupported uri schema: $schema. Converting to text.");
      return Clip.text(text: uri.uri.toString());
    }
  }

  Future<Clip?> processUri(ClipboardDataReader reader) async {
    // Make sure to request both values before awaiting
    final fileUriFuture = reader.readValue(Formats.fileUri);
    final uriFuture = reader.readValue(Formats.uri);

    // try file first and if it fails try regular URI
    final fileUri = await fileUriFuture;

    if (fileUri != null) {
      return await getFile(reader, fileUri);
    }

    final uri = await uriFuture;
    if (uri != null) {
      return await getUrl(reader, uri);
    }

    logger.info("Uri couldn't be parsed, trying with text.");

    return await _getPlainText(reader);
  }

  Future<Clip?> process(
    ClipboardDataReader reader,
    DataFormat format,
  ) async {
    switch (format) {
      case Formats.plainText:
        return await _getPlainText(reader);
      case Formats.plainTextFile:
        return await _getPlainTextFile(reader);
      // Images
      case Formats.png:
        return await getImage(reader, "png", format);
      case Formats.jpeg:
        return await getImage(reader, "jpeg", format);
      case Formats.gif:
        return await getImage(reader, "gif", format);
      case Formats.tiff:
        return await getImage(reader, "tiff", format);
      case Formats.webp:
        return await getImage(reader, "webp", format);
      case Formats.heic:
        return await getImage(reader, "heic", format);
      case Formats.svg:
        return await getImage(reader, "svg", format);

      // Files or Url
      case Formats.fileUri:
      case Formats.uri:
        return await processUri(reader);
      default:
        return null;
    }
  }
}

@injectable
class ClipboardService with ClipboardListener {
  bool writing = false;
  bool _started = false;
  late final BehaviorSubject<List<Clip?>> onCopy;
  final ClipboardFormatProcessor processor = ClipboardFormatProcessor();
  ClipboardWatcher get watcher => clipboardWatcher;

  Future<ClipboardReader?> getReader() async =>
      await SystemClipboard.instance?.read();

  Future<void> write(Iterable<DataWriterItem> items) async {
    writing = true;
    await SystemClipboard.instance?.write(items);
    await Future.delayed(Durations.short3, () => writing = false);
  }

  Future<void> start() async {
    if (_started) return;
    _started = true;
    watcher.addListener(this);
    onCopy = BehaviorSubject<List<Clip?>>();
    await watcher.start();
  }

  Future<void> dispose() async {
    if (!_started) return;
    _started = false;
    watcher.removeListener(this);
    await watcher.stop();
    await onCopy.close();
  }

  @override
  void onClipboardChanged() {
    if (writing) return;
    readClipboard();
  }

  Future<void> readClipboard() async {
    logger.info("Reading clipboard");
    await Future.delayed(Durations.short4);
    final reader = await getReader();

    if (reader == null) {
      logger.shout("Clipboard is not available!");
      return;
    }

    if (reader.items.isEmpty) {
      logger.warning("No item in clipboard");
      return;
    }

    final res = <DataFormat>{};
    int selectedPref = -1;
    for (final item in reader.items) {
      DataFormat? selectedFormat;
      final itemFormats = item.getFormats(Formats.standardFormats);
      for (final format in itemFormats) {
        if (selectedFormat == null) {
          selectedFormat = format;
          selectedPref = _clipTypePriority.indexOf(selectedFormat);
          continue;
        }

        final pref = _clipTypePriority.indexOf(format);

        if ((pref != -1 && pref < selectedPref) || selectedPref == -1) {
          selectedFormat = format;
          selectedPref = pref;
        }
      }
      if (selectedFormat != null) {
        res.add(selectedFormat);
      }
    }

    final clips = await Future.wait(
      res.map(
        (format) {
          return processor.process(reader, format);
        },
      ),
    );

    onCopy.add(clips);
  }
}
