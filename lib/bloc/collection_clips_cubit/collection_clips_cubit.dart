import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/clip_collection/clipcollection.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'collection_clips_cubit.freezed.dart';
part 'collection_clips_state.dart';

@injectable
class CollectionClipsCubit extends Cubit<CollectionClipsState> {
  final ClipboardRepository repo;
  final ClipCollection collection;
  CollectionClipsCubit(
    @Named("offline") this.repo, {
    @factoryParam required this.collection,
  }) : super(const CollectionClipsState.initial());

  Future<void> search([String? searchQuery]) async {
    switch (state) {
      case InitialCollectionClipsState() || CollectionClipsErrorState():
        {
          emit(
            CollectionClipsState.searching(query: searchQuery),
          );

          final items = await repo.getList(
            limit: 50,
            search: searchQuery,
            collectionId: collection.id,
          );

          emit(
            items.fold(
              (l) => CollectionClipsState.error(
                failure: l,
              ),
              (r) => CollectionClipsState.results(
                query: searchQuery,
                isLoading: false,
                results: r.results,
                offset: r.results.length,
                hasMore: r.hasMore,
              ),
            ),
          );
        }
        break;
      case CollectionClipsResultsState(
          :final query,
          :final results,
          :final offset,
          :final hasMore
        ):
        {
          final newQuery = searchQuery != null && query != searchQuery;
          if (!hasMore && !newQuery) return;
          emit(
            CollectionClipsState.searching(query: searchQuery ?? query),
          );
          final items = await repo.getList(
            limit: 50,
            offset: newQuery ? 0 : offset,
            search: searchQuery ?? query,
            collectionId: collection.id,
          );

          final nextState = items.fold(
            (l) => CollectionClipsState.error(
              failure: l,
            ),
            (r) => CollectionClipsState.results(
              query: searchQuery ?? query,
              results: newQuery ? r.results : [...results, ...r.results],
              offset: r.results.length + (newQuery ? 0 : offset),
              hasMore: r.hasMore,
            ),
          );
          emit(nextState);
        }
      case _:
    }
  }

  Future<void> deleteItem(ClipboardItem item) async {
    state.mapOrNull(results: (result) {
      final items = result.results.where((it) => it.id != item.id).toList();
      final isDeleted = items.length < result.results.length;
      emit(
        result.copyWith(
          results: items,
          offset: isDeleted ? result.offset - 1 : result.offset,
        ),
      );
    });
  }

  void put(ClipboardItem item) {
    if (item.collectionId != collection.id) {
      deleteItem(item);
      return;
    }

    state.mapOrNull(results: (result) {
      final items = result.results.replaceWhere((it) => it.id == item.id, item);
      emit(
        result.copyWith(results: items),
      );
    });
  }
}
