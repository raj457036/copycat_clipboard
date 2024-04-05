import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:super_clipboard/super_clipboard.dart';

part 'clipboard_cubit.freezed.dart';
part 'clipboard_state.dart';

@injectable
class ClipboardCubit extends Cubit<ClipboardState> with ClipboardListener {
  final Isar db;

  bool _writing = false;

  ClipboardCubit(
    this.db,
  ) : super(const ClipboardState.loaded(items: [])) {
    clipboardWatcher.addListener(this);
    clipboardWatcher.start();
  }

  Future<void> fetch() async {
    emit(state.copyWith(loading: true));
    final result =
        await db.clipboardItems.where().sortByCreatedDesc().findAll();
    emit(state.copyWith(loading: false, items: result));
  }

  Future<void> copyToClipboard(ClipboardItem item) async {
    _writing = true;
    final clipboard = SystemClipboard.instance;
    if (clipboard == null) {
      logger.severe("Clipboard is not available.");
      return;
    }
    final items = DataWriterItem();
    switch (item.type) {
      case ClipItemType.text:
        items.add(Formats.plainText(item.value!));
        break;
      default:
    }

    if (items.data.isNotEmpty) {
      await clipboard.write([items]);
    }

    await Future.delayed(Durations.extralong1, () => _writing = false);
  }

  bool isSameAsLastItem(ClipboardItem item) {
    return state.items.isNotEmpty &&
        state.items.first.type == item.type &&
        state.items.first.value == item.value;
  }

  Future<void> addItem(ClipboardItem item) async {
    if (isSameAsLastItem(item)) {
      logger.info("Ignored Duplicate item");
      return;
    }
    emit(state.copyWith(items: [item, ...state.items]));
    await db.writeTxn(() async => await db.clipboardItems.put(item));
  }

  Future<void> deleteItem(ClipboardItem item) async {
    emit(state.copyWith(items: state.items.where((it) => it != item).toList()));
    await db.writeTxn(() async => await db.clipboardItems.delete(item.id));
  }

  Future<ClipboardItem?> getClipboardItemForFormat(
      DataFormat format, DataReader reader) async {
    switch (format) {
      case Formats.plainText:
      // final text = await reader.readValue(Formats.plainText);
      // if (text == null) {
      //   return null;
      // } else {
      //   // Sometimes macOS uses CR for line break;
      //   final sanitized = text.replaceAll(RegExp('\r[\n]?'), '\n');
      //   return _RepresentationWidget(
      //     format: format,
      //     name: 'Plain Text',
      //     synthesized: reader.isSynthesized(format),
      //     virtual: reader.isVirtual(format),
      //     content: Text(sanitized),
      //   );
      // }
      case Formats.plainTextFile:
      // if (!reader.isVirtual(format) && !reader.isSynthesized(format)) {
      //   return null;
      // }
      // final contents = await reader.readFile(Formats.plainTextFile);
      // if (contents == null) {
      //   return null;
      // } else {
      //   final text = utf8.decode(contents, allowMalformed: true);
      //   return _RepresentationWidget(
      //     format: format,
      //     name: 'Plain Text (utf8 file)',
      //     synthesized: reader.isSynthesized(format),
      //     virtual: reader.isVirtual(format),
      //     content: Text(text),
      //   );
      // }
      case Formats.htmlText:
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
      // return _widgetForImage(context, Formats.png, 'PNG', reader);
      case Formats.jpeg:
      // return _widgetForImage(context, Formats.jpeg, 'JPEG', reader);
      case Formats.gif:
      // return _widgetForImage(context, Formats.gif, 'GIF', reader);
      case Formats.tiff:
      // return _widgetForImage(context, Formats.tiff, 'TIFF', reader);
      case Formats.webp:
      // return _widgetForImage(context, Formats.webp, 'WebP', reader);
      // regular and file uri may have same mime types on some platforms
      case Formats.uri:
      case Formats.fileUri:
      // Make sure to request both values before awaiting
      //   final fileUriFuture = reader.readValue(Formats.fileUri);
      //   final uriFuture = reader.readValue(Formats.uri);

      //   // try file first and if it fails try regular URI
      //   final fileUri = await fileUriFuture;
      //   if (fileUri != null) {
      //     return _RepresentationWidget(
      //       format: Formats.fileUri,
      //       name: 'File URI',
      //       synthesized: reader.isSynthesized(format),
      //       virtual: reader.isVirtual(format),
      //       content: Text(fileUri.toString()),
      //     );
      //   }
      //   final uri = await uriFuture;
      //   if (uri != null) {
      //     return _RepresentationWidget(
      //       format: Formats.uri,
      //       name: 'URI',
      //       synthesized: reader.isSynthesized(Formats.uri),
      //       virtual: reader.isVirtual(Formats.uri),
      //       content: _UriWidget(uri: uri),
      //     );
      //   }
      //   return null;
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

  Future<void> _readClipboard() async {
    final clipboard = SystemClipboard.instance;
    if (clipboard == null) {
      logger.severe("Clipboard is not available.");
      return;
    }

    final reader = await clipboard.read();

    if (reader.canProvide(Formats.plainText)) {
      final text = await reader.readValue(Formats.plainText);
      if (text != null) {
        addItem(ClipboardItem.fromText(text));
      }
    }

    // reader.items.map((e) => getClipboardItemForFormat(e.for, reader))
  }

  @override
  void onClipboardChanged() {
    if (_writing) {
      return;
    }
    logger.info("Copy Event Captured");
    _readClipboard();
  }

  @override
  Future<void> close() {
    clipboardWatcher.removeListener(this);
    clipboardWatcher.stop();
    return super.close();
  }
}
