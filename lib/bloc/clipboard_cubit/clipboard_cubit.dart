import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:clipboard/utils/common_extension.dart';
import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'clipboard_cubit.freezed.dart';
part 'clipboard_state.dart';

@singleton
class ClipboardCubit extends Cubit<ClipboardState> with ClipboardListener {
  final ClipboardRepository repo;

  ClipboardCubit(@Named("offline") this.repo)
      : super(const ClipboardState.loaded(items: []));

  void put(ClipboardItem item, {bool isNew = false}) {
    if (isNew) {
      emit(state.copyWith(items: [item, ...state.items]));
    } else {
      emit(
        state.copyWith(
          items: state.items.replaceWhere((it) => it.id == item.id, item),
        ),
      );
    }
  }

  Future<void> fetch({bool fromTop = false}) async {
    emit(state.copyWith(loading: true));

    final items = await repo.getList(
      limit: state.limit,
      offset: fromTop ? 0 : state.offset,
    );

    emit(
      items.fold(
        (l) => state.copyWith(
          failure: l,
          loading: false,
        ),
        (r) => state.copyWith(
          loading: false,
          items: fromTop ? r.results : [...state.items, ...r.results],
          offset: state.offset + r.results.length,
          limit: state.limit,
          hasMore: r.hasMore,
        ),
      ),
    );
  }

  Future<bool> copyToClipboard(ClipboardItem item,
      [bool copyFileContent = false]) async {
    // _writing = true;
    // final clipboard = SystemClipboard.instance;
    // if (clipboard == null) {
    //   logger.severe("Clipboard is not available.");
    //   return false;
    // }

    // final data = await getFormatForClipboardItem(item, copyFileContent);
    // if (data == null) return false;

    // final items = DataWriterItem()..add(data);
    // await clipboard.write([items]);
    // await Future.delayed(Durations.short1, () => _writing = false);
    return true;
  }

  Future<Failure?> deleteItem(ClipboardItem item) async {
    emit(state.copyWith(items: state.items.where((it) => it != item).toList()));
    await item.cleanUp();

    final result = await repo.delete(item);
    return result.fold((l) => l, (r) => null);
  }
}
