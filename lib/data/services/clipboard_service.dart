import 'dart:async' show FutureOr;

import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:copycat_base/common/logging.dart';
import 'package:copycat_base/data/services/clipboard_service.dart';
import 'package:easy_worker/easy_worker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart' as mime;
import "package:path/path.dart" as p;
import 'package:rxdart/rxdart.dart';
import 'package:super_clipboard/super_clipboard.dart';
import "package:universal_io/io.dart";
import 'package:window_manager/window_manager.dart';

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

@singleton
class ClipboardService with ClipboardListener {
  bool _writing = false;
  bool _started = false;

  void Function()? onRead;
  BehaviorSubject<List<ClipItem?>>? onCopy;
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

    onCopy?.add(clips);
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
    FutureOr<EncodedData>? format;

    for (final f in Formats.standardFormats) {
      if (f is SimpleFileFormat) {
        final mime_ = mimeType ?? mime.lookupMimeType(file.path);
        final isThis = f.mimeTypes?.contains(mime_);
        if (isThis != null && isThis) {
          format = f.lazy(() => file.readAsBytes());
          break;
        }
      }
    }

    if (format == null) {
      logger.w(
        "Couldn't determine mime type for file ${file.path} with mime type $mimeType",
      );

      return await saveFile(file);
    }

    final item = DataWriterItem()..add(format);
    return writeToClipboard(item);
  }

  Future<bool> saveFile(File file) async {
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save to',
      fileName: p.basename(file.path),
      bytes: await file.readAsBytes(),
      lockParentWindow: true,
    );

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      windowManager.show();
    }

    if (outputFile == null) return false;

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final ext = p.extension(file.path);
      outputFile = p.setExtension(outputFile, ext);
      final result = await EasyWorker.compute<bool, (String, String)>(
        copyFile,
        (file.path, outputFile),
        name: "Copy File",
      );
      return result;
    }
    return true;
  }
}
