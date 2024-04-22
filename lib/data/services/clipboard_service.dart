import 'dart:async' show Completer, FutureOr;
import 'dart:convert' show utf8;
import 'dart:io';
import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/enums/clip_type.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:image/image.dart' as img;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import "package:path/path.dart" as p;
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

class ClipItem {
  final ClipItemType type;
  final File? file;
  final String? fileName;
  final String? fileMimeType;
  final String? fileExtension;
  final String? blurHash;
  final int? fileSize;
  final String? text;
  final Uri? uri;
  final TextCategory? textCategory;

  ClipItem({
    required this.type,
    required this.file,
    required this.fileName,
    required this.text,
    required this.uri,
    required this.fileMimeType,
    required this.fileExtension,
    required this.fileSize,
    this.textCategory,
    this.blurHash,
  });

  bool get isImage => fileMimeType?.startsWith("image") ?? false;
  bool get isVideo => fileMimeType?.startsWith("video") ?? false;
  bool get isAudio => fileMimeType?.startsWith("audio") ?? false;
  bool get isText => type == ClipItemType.text;
  bool get isUri => type == ClipItemType.url;
  bool get isFile => type == ClipItemType.file;

  Future<void> cleanup() async {
    if (file != null && await file!.exists()) {
      await file!.delete();
    }
  }

  factory ClipItem.text({
    required String text,
    TextCategory? textCategory,
  }) =>
      ClipItem(
        file: null,
        fileName: null,
        uri: null,
        text: text,
        type: ClipItemType.text,
        fileMimeType: null,
        fileExtension: null,
        fileSize: null,
        textCategory: textCategory,
      );

  factory ClipItem.uri({
    required Uri uri,
  }) =>
      ClipItem(
        file: null,
        fileName: null,
        uri: uri,
        text: null,
        type: ClipItemType.url,
        fileMimeType: null,
        fileExtension: null,
        fileSize: null,
      );

  factory ClipItem.imageFile({
    required File file,
    String? fileName,
    required String mimeType,
    required int fileSize,
    String? blurHash,
  }) =>
      ClipItem(
        fileName: fileName,
        file: file,
        uri: null,
        text: null,
        type: ClipItemType.media,
        fileMimeType: mimeType,
        fileExtension: p.extension(file.path),
        fileSize: fileSize,
        blurHash: blurHash,
      );

  factory ClipItem.file({
    required File file,
    String? textPreview,
    String? fileName,
    required String mimeType,
    required int fileSize,
  }) =>
      ClipItem(
        file: file,
        fileName: fileName,
        uri: null,
        text: textPreview,
        type: ClipItemType.file,
        fileMimeType: mimeType,
        fileExtension: p.extension(file.path),
        fileSize: fileSize,
      );
}

final rgbRegex = RegExp(r"^#?(?:[0-9a-fA-F]{3}){1,2}$");
final rgbaRegex = RegExp(r"^#?(?:[0-9a-fA-F]{3,4}){1,2}$");
final emailRegex = RegExp(
    r"^([a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*)$");
final phoneRegex = RegExp(r'^\d{7,15}$');

(bool, String) parseColor(String value) {
  final rgb = rgbRegex.stringMatch(value);
  if (rgb != null) {
    return (true, rgb);
  }
  final rgba = rgbaRegex.stringMatch(value);
  if (rgba != null) {
    return (true, rgba);
  }
  return (false, value);
}

(bool, String) parseEmail(String value) {
  final email = emailRegex.stringMatch(value);
  if (email != null) {
    return (true, email);
  }
  return (false, value);
}

(bool, String) parsePhone(String value) {
  final phone = phoneRegex.stringMatch(value);
  if (phone != null) {
    return (true, phone);
  }
  return (false, value);
}

(TextCategory?, String) getTextCategory(String value) {
  final (isColor, color) = parseColor(value);
  if (isColor) return (TextCategory.color, color);

  final (isEmail, email) = parseEmail(value);
  if (isEmail) return (TextCategory.email, email);

  final (isPhone, phone) = parsePhone(value);
  if (isPhone) return (TextCategory.phone, phone);

  return (null, value);
}

String? getBlurHash(Uint8List bin) {
  try {
    final image = img.decodeImage(bin);
    return BlurHash.encode(image!, numCompX: 4, numCompY: 3).hash;
  } catch (e) {
    logger.e(
      "Couldn't get blur hash from the image!",
      error: e,
    );
    return null;
  }
}

Future<(File?, String?, int)> writeToClipboardCacheFile({
  required String folder,
  required String ext,
  String? fileName,
  Uint8List? content,
  String? textContent,
  File? file,
}) async {
  /// returns file, mimetype and size
  assert(
    !(file == null && content == null && textContent == null),
    "Provide atleast one of content, textContent or file",
  );

  final appDirPath = await getPersistedRootDirPath();

  final directory = p.join(appDirPath, folder);
  await createDirectoryIfNotExists(directory);
  final path = p.join(directory, "${getId()}_${fileName ?? ''}.$ext");
  final file_ = File(path);

  if (file != null) {
    await file.copy(path);
    return (file_, mime.lookupMimeType(file.path), await file.length());
  } else if (textContent != null) {
    await file_.writeAsString(textContent);
    return (file_, "text/plain", textContent.length);
  } else if (content != null) {
    await file_.writeAsBytes(content);
    return (
      file_,
      mime.lookupMimeType(
        path,
        headerBytes: content.sublist(0, 100),
      ),
      content.length,
    );
  }
  return (null, null, 0);
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

  Future<ClipItem?> _getPlainText(ClipboardDataReader reader) async {
    String? text;

    try {
      text = await reader.readValue(Formats.plainText);
    } catch (e) {
      final data = await service.Clipboard.getData("text/plain");

      if (data != null) {
        text = data.text;
      }
    }
    if (text == null) {
      logger.w("Text is null");
      return null;
    } else {
      text = text.replaceAll(RegExp('\r[\n]?'), '\n');
      text = cleanText(text);
      final (textCategory, parsedText) = getTextCategory(text);
      return ClipItem.text(
        text: parsedText,
        textCategory: textCategory,
      );
    }
  }

  Future<ClipItem?> _getPlainTextFile(ClipboardDataReader reader) async {
    final (fileName, binary) = await readFile(reader, Formats.plainTextFile);

    if (binary == null) {
      logger.w("Text file is null or empty.");
      return null;
    }
    final text = cleanText(utf8.decode(binary, allowMalformed: true));

    // TODO check file name if it ends with anything other then txt or "blank"
    // Todo: then its a file.
    if (text.length <= 1024) {
      return ClipItem.text(text: text);
    }

    final (file, mimeType, size) = await writeToClipboardCacheFile(
      folder: "files",
      ext: "txt",
      fileName: fileName,
      textContent: text,
    );

    if (file == null) return null;

    return ClipItem.file(
      file: file,
      mimeType: mimeType ?? "application/octet-stream",
      textPreview: text,
      fileName: fileName,
      fileSize: size,
    );
  }

  Future<ClipItem?> getImage(
    ClipboardDataReader reader,
    String ext,
    DataFormat format,
  ) async {
    final (fileName, binary) = await readFile(
      reader,
      format as FileFormat,
    );

    if (binary == null) {
      logger.w("Couldn't read content of image file with format $format");
      return null;
    }

    final (file, mimeType, size) = await writeToClipboardCacheFile(
      folder: "medias",
      ext: ext,
      fileName: fileName,
      content: binary,
    );

    if (file == null) return null;

    String? blurHash = getBlurHash(binary);

    return ClipItem.imageFile(
      file: file,
      mimeType: mimeType ?? "application/octet-stream",
      fileName: fileName,
      fileSize: size,
      blurHash: blurHash,
    );
  }

  Future<ClipItem?> getFile(
    ClipboardDataReader reader,
    Uri uri,
  ) async {
    File file;
    try {
      final filePath = Uri.decodeFull(uri.path);
      file = File(filePath);
    } catch (e) {
      logger.e(e);
      return null;
    }

    // check if file exists
    final exists = await file.exists();
    if (!exists) {
      logger.w("Couldn't find file at $uri");
      return null;
    }

    final ext = p.extension(file.path).substring(1);
    final fileName = p.basenameWithoutExtension(file.path);
    final (cacheFile, mimeType, size) = await writeToClipboardCacheFile(
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
    );
  }

  Future<ClipItem> getUrl(ClipboardDataReader reader, NamedUri uri) async {
    final schema = uri.uri.scheme;
    final isSupported = _supportedUriSchemas.contains(schema);
    if (isSupported) {
      return ClipItem.uri(uri: uri.uri);
    } else {
      logger.w("Unsupported uri schema: $schema. Converting to text.");
      return ClipItem.text(text: cleanText(uri.uri.toString()));
    }
  }

  Future<ClipItem?> processUri(ClipboardDataReader reader) async {
    // Make sure to request both values before awaiting
    final fileUriFuture = reader.readValue(Formats.fileUri);
    final uriFuture = reader.readValue(Formats.uri);

    // try file first and if it fails try regular URI
    final fileUri = await fileUriFuture;

    if (fileUri != null) {
      return await getFile(reader, fileUri);
    }

    NamedUri? uri;

    try {
      uri = await uriFuture;
    } catch (e) {
      return await _getPlainText(reader);
    }

    if (uri != null) {
      return await getUrl(reader, uri);
    }

    logger.i("Uri couldn't be parsed, trying with text.");

    return await _getPlainText(reader);
  }

  Future<ClipItem?> process(
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

@singleton
class ClipboardService with ClipboardListener {
  bool _writing = false;
  bool _started = false;

  void Function()? onRead;
  late final BehaviorSubject<List<ClipItem?>> onCopy;
  final ClipboardFormatProcessor processor = ClipboardFormatProcessor();
  ClipboardWatcher get watcher => clipboardWatcher;

  Future<ClipboardReader?> getReader() async =>
      await SystemClipboard.instance?.read();

  void setWriting(bool writing) {
    _writing = writing;
  }

  Future<void> write(Iterable<DataWriterItem> items) async {
    setWriting(true);
    await SystemClipboard.instance?.write(items);
    await Future.delayed(Durations.short3, () => setWriting(false));
  }

  Future<void> start([void Function()? onRead]) async {
    if (_started) return;
    _started = true;
    this.onRead = onRead;
    onCopy = BehaviorSubject<List<ClipItem?>>();
    if (!(Platform.isAndroid || Platform.isIOS)) {
      watcher.addListener(this);
      await watcher.start();
    }
  }

  Future<void> dispose() async {
    if (!_started) return;
    _started = false;
    onRead = null;
    watcher.removeListener(this);
    await watcher.stop();
    await onCopy.close();
  }

  @override
  void onClipboardChanged() {
    if (_writing) return;

    if (onRead != null) {
      onRead!();
    } else {
      readClipboard();
    }
  }

  Future<List<ClipItem?>?> readClipboard({bool manual = false}) async {
    logger.i("Reading clipboard");
    await Future.delayed(Durations.short4);
    final reader = await getReader();

    if (reader == null) {
      logger.e("Clipboard is not available!");
      return null;
    }

    if (reader.items.isEmpty) {
      logger.w("No item in clipboard");
      return null;
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

    if (manual) {
      return clips;
    }

    onCopy.add(clips);
    return null;
  }
}

class CopyToClipboard {
  final ClipboardService service;

  CopyToClipboard(this.service);

  Future<bool> writeToClipboard(DataWriterItem item) async {
    try {
      await service.write([item]);
      return true;
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  Future<bool> text(String text) {
    final item = DataWriterItem();
    item.add(Formats.plainText(text));
    return writeToClipboard(item);
  }

  Future<bool> url(Uri? uri) {
    if (uri == null) return Future.value(false);
    final item = DataWriterItem();
    item.add(Formats.uri(NamedUri(uri)));
    return writeToClipboard(item);
  }

  Future<bool> fileContent(File file, {String? mimeType}) async {
    final bytes = await file.readAsBytes();
    FutureOr<EncodedData>? format;

    for (final f in Formats.standardFormats) {
      if (f is SimpleFileFormat) {
        final mime_ = mimeType ?? mime.lookupMimeType(file.path);
        final isThis = f.mimeTypes?.contains(mime_);
        if (isThis != null && isThis) {
          format = f(bytes);
          break;
        }
      }
    }

    if (format == null) {
      logger.w(
        "Couldn't determine mime type for file ${file.path} with mime type $mimeType",
      );
      return false;
    }

    final item = DataWriterItem()..add(format);
    return writeToClipboard(item);
  }

  Future<bool> file(File file, {bool copyTo = false}) async {
    if (Platform.isAndroid || Platform.isIOS || copyTo) {
      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save to',
        fileName: "clipboard_item${p.extension(file.path)}",
        bytes: await file.readAsBytes(),
      );

      if (outputFile == null) return false;

      if (copyTo &&
          (Platform.isLinux || Platform.isMacOS || Platform.isWindows)) {
        await file.copy(outputFile);
      }
      return true;
    }

    final item = DataWriterItem();
    item.add(Formats.fileUri(file.uri));
    return writeToClipboard(item);
  }
}
