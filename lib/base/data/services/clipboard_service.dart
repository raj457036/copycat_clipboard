import 'package:clipboard/base/background/file_ops_worker.dart';
import 'package:clipboard/base/constants/misc.dart';
import 'package:clipboard/base/data/services/clipboard/clip_models.dart';
import 'package:clipboard/base/data/services/clipboard/format_processor.dart';
import 'package:clipboard/base/data/services/clipboard/rich_data.dart';
import 'package:clipboard/base/data/services/clipboard/read_strategy.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/utils/utility.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import 'package:path/path.dart' as p;
import 'package:rxdart/rxdart.dart';
import 'package:super_clipboard/super_clipboard.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

// Re-export sub-modules so all existing `import clipboard_service.dart`
// callers continue to resolve every public type without changes.
export 'package:clipboard/base/data/services/clipboard/clip_models.dart';
export 'package:clipboard/base/data/services/clipboard/format_processor.dart';
export 'package:clipboard/base/data/services/clipboard/rich_data.dart';
export 'package:clipboard/base/data/services/clipboard/read_strategy.dart';

@singleton
class ClipboardService with ClipboardListener {
  static const _logger = AppLogger.scoped('Clipboard Service');
  static const _fileClipboardChannel = MethodChannel(
    'com.entilitystudio.CopyCat/drag_file_uri',
  );
  bool _writing = false;
  bool _started = false;
  int _captureSuppressionDepth = 0;
  bool _richDataEnabled = false;
  final SimpleClipboardReadStrategy _readStrategy =
      const SimpleClipboardReadStrategy();

  void Function()? onRead;
  BehaviorSubject<List<ClipItem?>>? onCopy;
  final ClipboardFormatProcessor processor = ClipboardFormatProcessor();
  final RichTextDataHandler _richTextHandler = RichTextDataHandler();

  ClipboardWatcher get watcher => clipboardWatcher;

  Future<void> _captureRichRepresentations(
    DataReader reader,
    ClipItem clip,
  ) async {
    if (!_richDataEnabled) return;
    if (!_richTextHandler.supportsCapture(clip)) return;
    await _richTextHandler.capture(
      reader: reader,
      clip: clip,
      processor: processor,
    );
  }

  bool writeRichTextIfAvailable(
    List<DataWriterItem> sink, {
    required String text,
    String? richData,
    TextPasteFormat mode = TextPasteFormat.auto,
  }) {
    if (!_richDataEnabled) return false;
    return _richTextHandler.writeRich(
      sink: sink,
      text: text,
      richData: richData,
      mode: mode,
    );
  }

  Future<ClipboardReader?> getReader() async =>
      await SystemClipboard.instance?.read();

  void setWriting([bool writing = false]) {
    _writing = writing;
  }

  void setRichDataEnabled(bool enabled) {
    _richDataEnabled = enabled;
    _logger.d(() => "Rich data capture ${enabled ? 'enabled' : 'disabled'}");
  }

  bool get richDataEnabled => _richDataEnabled;

  bool get isCaptureSuppressed => _captureSuppressionDepth > 0;

  Future<T> runWithCaptureSuppressed<T>(Future<T> Function() action) async {
    _captureSuppressionDepth++;
    try {
      return await action();
    } finally {
      _captureSuppressionDepth--;
      if (_captureSuppressionDepth < 0) {
        _captureSuppressionDepth = 0;
      }
    }
  }

  Future<void> write(
    Iterable<DataWriterItem> items, {
    List<Uri>? androidFileUris,
  }) async {
    if (items.isEmpty) return;
    setWriting(true);
    try {
      if (androidFileUris != null) {
        await _fileClipboardChannel.invokeMethod<void>(
          'writeFileClipboard',
          {'uris': androidFileUris.map((uri) => uri.toString()).toList()},
        );
      } else {
        await SystemClipboard.instance?.write(items);
      }
      await wait(Durations.short1.inMilliseconds);
    } finally {
      setWriting();
    }
  }

  Future<void> start([void Function()? onRead]) async {
    if (_started) return;
    _started = true;
    this.onRead = onRead;
    onCopy = BehaviorSubject<List<ClipItem?>>();
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
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
    await onCopy?.close();
  }

  @override
  void onClipboardChanged() {
    if (_writing || isCaptureSuppressed) return;

    if (onRead != null) {
      onRead!();
    } else {
      readClipboard();
    }
  }

  Future<List<ClipItem?>?> readClipboard({bool manual = false}) async {
    _logger.d("Reading clipboard");
    await wait(Durations.short2.inMilliseconds);
    final reader = await getReader();

    if (reader == null) {
      _logger.e("Clipboard is not available!");
      return null;
    }

    if (reader.items.isEmpty) {
      _logger.w("No item in clipboard");
      return null;
    }

    final readerSet = _readStrategy.selectReaders(
      reader: reader,
      supportedFormats: allSupportedClipFormats,
    );

    if (readerSet.isEmpty) {
      _logger.i(() => "No supported clipboard item format found");
      return null;
    }

    final clips = await processMultipleReaderDataFormat(
      readerSet,
      manual: manual,
    );
    return clips;
  }

  DataFormat<Object>? selectFormatForItem(List<DataFormat> itemFormats) {
    return _readStrategy.selectFromItemFormats(itemFormats);
  }

  Future<List<ClipItem?>?> processMultipleReaderDataFormat(
    Iterable<(DataReader, DataFormat<Object>)> readerSet, {
    bool manual = false,
  }) async {
    final records = readerSet.toList(growable: false);
    final clips = await Future.wait(
      records.map((record) {
        final (reader, format) = record;
        return processor.process(reader, format);
      }),
    );

    await Future.wait([
      for (var i = 0; i < clips.length; i++)
        if (clips[i] != null && !clips[i]!.isDuplicate)
          _captureRichRepresentations(records[i].$1, clips[i]!),
    ]);

    if (manual) {
      return clips;
    }

    onCopy?.add(clips);
    return null;
  }

  Future<List<ClipItem?>?> processSingleReaderDataFormat(
    DataReader reader,
    Iterable<DataFormat<Object>> data, {
    bool manual = false,
  }) async {
    final clips = await Future.wait(
      data.map((format) {
        return processor.process(reader, format);
      }),
    );

    await Future.wait([
      for (final clip in clips)
        if (clip != null && !clip.isDuplicate)
          _captureRichRepresentations(reader, clip),
    ]);

    if (manual) {
      return clips;
    }

    onCopy?.add(clips);
    return null;
  }
}

/// Accumulates clipboard write operations and commits them as a single
/// clipboard write, suppressing the re-capture listener.
class CopyToClipboard {
  final List<DataWriterItem> _items;
  final List<Uri> _androidFileUris = [];

  CopyToClipboard() : _items = <DataWriterItem>[];

  Future<bool> commit(ClipboardService service) async {
    if (_items.isEmpty) return false;
    try {
      await service.runWithCaptureSuppressed(() async {
        await service.write(
          _items,
          // Mixed batches keep all representations on the standard writer.
          androidFileUris: _androidFileUris.length == _items.length
              ? _androidFileUris
              : null,
        );
      });
      return true;
    } catch (e) {
      logger.e(() => "[CopyToClipboard] Failed to write to clipboard - $e");
      return false;
    }
  }

  Future<bool> writeText(String text) async {
    if (text.isEmpty) return false;
    final item = DataWriterItem(suggestedName: "Text");
    item.add(Formats.plainText(text));
    _items.add(item);
    return true;
  }

  /// Writes rich text + plain text when rich data is available and [mode]
  /// allows it; falls back to plain text otherwise.
  Future<bool> writeRichText(
    ClipboardService service, {
    required String text,
    String? richData,
    TextPasteFormat mode = TextPasteFormat.auto,
  }) async {
    final success = service.writeRichTextIfAvailable(
      _items,
      text: text,
      richData: richData,
      mode: mode,
    );
    if (!success) return await writeText(text);
    return success;
  }

  bool writeUrl(Uri? uri) {
    if (uri == null) return false;
    final item = DataWriterItem(suggestedName: "Uri");
    item.add(Formats.uri(NamedUri(uri)));
    _items.add(item);
    return true;
  }

  List<DataWriterItem> get items => List.unmodifiable(_items);

  Future<bool> writeFileContent(
    File file, {
    String? mimeType,
    String? fileName,
  }) async {
    if (!await file.exists()) {
      logger.w(() => "[CopyToClipboard] File does not exist at ${file.path}");
      return false;
    }

    final String resolvedMime =
        mimeType ??
        mime.lookupMimeType(file.path) ??
        'application/octet-stream';
    final String baseName = fileName?.trim().isNotEmpty == true
        ? fileName!.trim()
        : p.basename(file.path);
    final Uri resolvedUri = await resolveFileUri(file.path, fileName: baseName);

    final DataWriterItem item = DataWriterItem(suggestedName: baseName);

    final String lowerMime = resolvedMime.toLowerCase();

    if (lowerMime.startsWith('image/')) {
      SimpleFileFormat? imageFormat;
      for (final f in allSupportedClipFormats) {
        if (f is SimpleFileFormat &&
            (f.mimeTypes?.contains(resolvedMime) ?? false)) {
          imageFormat = f;
          break;
        }
      }
      imageFormat ??= Formats.png;
      item.add(imageFormat.lazy(() => file.readAsBytes()));
      item.add(Formats.fileUri(resolvedUri));
    } else {
      item.add(Formats.fileUri(resolvedUri));
    }

    _items.add(item);
    if (defaultTargetPlatform == TargetPlatform.android &&
        resolvedUri.scheme == 'content') {
      _androidFileUris.add(resolvedUri);
    }
    return true;
  }

  Future<bool> saveFile(
    File file, {
    String? fileName,
    String? fileExtension,
    String? mimeType,
  }) async {
    final baseName = fileName?.trim().isNotEmpty == true
        ? fileName!.trim()
        : p.basename(file.path);

    var ext =
        (fileExtension?.trim().isNotEmpty == true
                ? fileExtension!.trim()
                : p.extension(baseName))
            .replaceAll('.', '')
            .toLowerCase();

    if (ext.isEmpty) {
      ext = p.extension(file.path).replaceAll('.', '').toLowerCase();
    }

    final resolvedFileName =
        ext.isNotEmpty && !baseName.toLowerCase().endsWith('.$ext')
        ? '$baseName.$ext'
        : baseName;

    final bytes = await file.readAsBytes();

    String? outputFile = await FilePicker.saveFile(
      dialogTitle: 'Save to',
      fileName: resolvedFileName,
      type: ext.isNotEmpty ? FileType.custom : FileType.any,
      allowedExtensions: ext.isNotEmpty ? [ext] : null,
      bytes: bytes,
      lockParentWindow: isDesktopPlatform,
    );

    if (isDesktopPlatform) {
      windowManager.show();
    }

    if (outputFile == null) return false;

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      if (ext.isNotEmpty) {
        outputFile = p.setExtension(outputFile, '.$ext');
      }
      final result = await copyFileInBackground(file.path, outputFile);
      return result;
    }
    return true;
  }
}
