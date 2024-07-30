import 'package:bloc/bloc.dart';
import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/clipboard_item/clipboard_item.dart';
import 'package:copycat_base/domain/repositories/analytics.dart';
import 'package:copycat_base/domain/repositories/clipboard.dart';
import 'package:copycat_base/enums/clip_type.dart';
import 'package:copycat_base/utils/common_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final AnalyticsRepository analyticsRepo;
  final ClipboardRepository repo;
  SearchCubit(
    @Named("offline") this.repo,
    this.analyticsRepo,
  ) : super(const SearchState.initial());

  Future<void> search(
    String? searchQuery, {
    List<String>? textClipCategories,
    List<ClipItemType>? clipTypes,
  }) async {
    analyticsRepo.logFeatureUsed(feature: "search");
    switch (state) {
      case InitialSearchState() || SearchErrorState():
        {
          if (searchQuery == null) return;
          emit(
            SearchState.searching(
              query: searchQuery,
              types: clipTypes,
              textCategories: textClipCategories,
            ),
          );

          final items = await repo.getList(
            limit: 50,
            search: searchQuery,
            types: clipTypes,
            category: textClipCategories,
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
                types: clipTypes,
                textCategories: textClipCategories,
              ),
            ),
          );
        }
        break;
      case SearchResultState(
          :final query,
          :final results,
          :final offset,
          :final hasMore,
          :final types,
          :final textCategories,
        ):
        {
          final newQuery = searchQuery != null && query != searchQuery;
          if (!hasMore && !newQuery) return;
          emit(
            SearchState.searching(
              query: searchQuery ?? query,
              types: clipTypes ?? types,
              textCategories: textClipCategories ?? textCategories,
            ),
          );
          final items = await repo.getList(
            limit: 50,
            offset: newQuery ? 0 : offset,
            search: searchQuery ?? query,
            types: clipTypes ?? types,
            category: textClipCategories ?? textCategories,
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
              types: clipTypes ?? types,
              textCategories: textClipCategories ?? textCategories,
            ),
          );
          emit(nextState);
        }
      case _:
    }
  }

  void put(ClipboardItem item) {
    state.mapOrNull(results: (result) {
      final items = result.results.replaceWhere((it) => it.id == item.id, item);
      emit(
        result.copyWith(results: items),
      );
    });
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
}
