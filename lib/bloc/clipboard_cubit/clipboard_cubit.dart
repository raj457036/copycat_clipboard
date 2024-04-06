import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/clipboard_cubit/utils.dart';
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

  Future<bool> copyToClipboard(ClipboardItem item) async {
    _writing = true;
    final clipboard = SystemClipboard.instance;
    if (clipboard == null) {
      logger.severe("Clipboard is not available.");
      return false;
    }

    final data = await getFormatForClipboardItem(item);
    if (data == null) return false;

    final items = DataWriterItem()..add(data);
    await clipboard.write([items]);
    await Future.delayed(Durations.extralong1, () => _writing = false);
    return true;
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
    await item.cleanup();
    await db.writeTxn(() async => await db.clipboardItems.delete(item.id));
  }

  Future<void> _readClipboard() async {
    final clipboard = SystemClipboard.instance;
    if (clipboard == null) {
      logger.severe("Clipboard is not available.");
      return;
    }

    final reader = await clipboard.read();

    final res = <DataFormat>{};
    for (final item in reader.items) {
      final itemFormats = item.getFormats(Formats.standardFormats);
      for (final format in itemFormats) {
        if (!res.contains(format)) {
          res.add(format);
        }
      }
    }

    if (res.contains(Formats.plainText) && res.contains(Formats.uri)) {
      // To prevent duplicate entry for both text and uri.
      res.remove(Formats.plainText);
    }

    final items = await Future.wait(
        res.map((format) => getClipboardItemForFormat(format, reader)));

    items.where((element) => element != null).forEach((e) => addItem(e!));
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
