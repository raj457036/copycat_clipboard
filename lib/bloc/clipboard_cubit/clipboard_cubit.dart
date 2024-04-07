import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart';
import 'package:clipboard/bloc/clipboard_cubit/utils.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/common/logging.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_clipboard/super_clipboard.dart';

part 'clipboard_cubit.freezed.dart';
part 'clipboard_state.dart';

@injectable
class ClipboardCubit extends Cubit<ClipboardState> with ClipboardListener {
  final ClipboardRepository repo;
  final AuthCubit authCubit;

  bool _writing = false;

  ClipboardCubit(
    this.repo,
    this.authCubit,
  ) : super(const ClipboardState.loaded(items: [])) {
    clipboardWatcher.addListener(this);
    clipboardWatcher.start();
  }

  Future<void> fetch() async {
    emit(state.copyWith(loading: true));
    final items = await repo.getList(
      limit: state.limit,
      offset: state.offset,
    );

    emit(
      items.fold(
        (l) => state.copyWith(
          failure: l,
          loading: false,
        ),
        (r) => state.copyWith(
          loading: false,
          items: [...state.items, ...r],
          offset: state.offset + r.length,
          limit: state.limit,
          hasMore: state.limit == r.length,
        ),
      ),
    );
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

  Future<(Failure?, ClipboardItem?)> addItem(ClipboardItem item) async {
    if (isSameAsLastItem(item)) {
      logger.info("Ignored Duplicate item");
      return (null, null);
    }
    emit(state.copyWith(items: [item, ...state.items]));

    final result = await repo.create(item);

    return result.fold((l) => (l, null), (r) => (null, r));
  }

  Future<Failure?> deleteItem(ClipboardItem item) async {
    emit(state.copyWith(items: state.items.where((it) => it != item).toList()));
    await item.cleanUp();

    final result = await repo.delete(item);
    return result.fold((l) => l, (r) => null);
  }

  Future<void> _readClipboard() async {
    if (authCubit.userId == null) return;
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

    final items = await Future.wait(res.map((format) =>
        getClipboardItemForFormat(authCubit.userId!, format, reader)));

    for (var item in items.where((element) => element != null)) {
      await addItem(item!);
    }
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
