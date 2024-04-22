import 'package:bloc/bloc.dart';
import 'package:clipboard/common/failure.dart';
import 'package:clipboard/data/repositories/clipboard.dart';
import 'package:clipboard/db/clipboard_item/clipboard_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ClipboardRepository repo;
  SearchCubit(@Named("offline") this.repo) : super(const SearchState.initial());

  Future<void> search(String? searchQuery) async {
    switch (state) {
      case InitialSearchState() || SearchErrorState():
        {
          if (searchQuery == null) return;
          emit(
            SearchState.searching(query: searchQuery),
          );

          final items = await repo.getList(
            limit: 50,
            search: searchQuery,
          );

          emit(
            items.fold(
              (l) => SearchState.error(
                failure: l,
              ),
              (r) => SearchState.results(
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
      case SearchResultState(
          :final query,
          :final results,
          :final offset,
          :final hasMore
        ):
        {
          final newQuery = searchQuery != null && query != searchQuery;
          if (!hasMore && !newQuery) return;
          emit(
            SearchState.searching(query: searchQuery ?? query),
          );
          final items = await repo.getList(
            limit: 50,
            offset: newQuery ? 0 : offset,
            search: searchQuery ?? query,
          );

          final nextState = items.fold(
            (l) => SearchState.error(
              failure: l,
            ),
            (r) => SearchState.results(
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
      emit(
        result.copyWith(
          results: result.results.where((it) => it.id != item.id).toList(),
        ),
      );
    });
  }
}
