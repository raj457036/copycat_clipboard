import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

part 'clipboard_cubit.freezed.dart';
part 'clipboard_state.dart';

@injectable
class ClipboardCubit extends Cubit<ClipboardState> {
  final ClipboardRepository repo;
  final Isar db;

  ClipboardCubit(
    @Named("offline") this.repo,
    this.db,
  ) : super(const ClipboardState.loaded(items: []));

  Future<void> fixDatabase() async {
    // await db
    //     .writeTxn(() async => await .deleteAll([77, 87, 79]));
  }

  void reset() {
    emit(const ClipboardState.loaded(items: []));
  }

  void put(ClipboardItem item, {bool isNew = false}) {
    if (isNew) {
      emit(state.copyWith(items: [item, ...state.items]));
    } else {
      final items = state.items.replaceWhere((it) => it.id == item.id, item);
      emit(
        state.copyWith(items: items),
      );
    }
  }

  bool fetchIfInitBatch() {
    if (state.items.length <= 50) {
      fetch(fromTop: true);
      return true;
    }
    return false;
  }

  Future<void> fetch({bool fromTop = false}) async {
    await fixDatabase();
    emit(
      state.copyWith(
        loading: true,
        offset: fromTop ? 0 : state.offset,
      ),
    );

    final items = await repo.getList(
      limit: state.limit,
      offset: fromTop ? 0 : state.offset,
      // sortBy: ClipboardSortKey.modified,
      // order: SortOrder.desc,
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

  Future<void> deleteItem(ClipboardItem item) async {
    final result = state.items.where((it) => it.id != item.id).toList();
    final isDeleted = result.length < state.items.length;
    emit(
      state.copyWith(
        items: result,
        offset: isDeleted ? state.offset - 1 : state.offset,
      ),
    );
  }
}
