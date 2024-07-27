part of 'collection_clips_cubit.dart';

@freezed
sealed class CollectionClipsState with _$CollectionClipsState {
  const factory CollectionClipsState.initial() = InitialCollectionClipsState;
  const factory CollectionClipsState.searching({String? query}) =
      SearchingCollectionClipsState;
  const factory CollectionClipsState.results({
    String? query,
    required List<ClipboardItem> results,
    @Default(false) bool hasMore,
    @Default(false) bool isLoading,
    @Default(0) int offset,
  }) = CollectionClipsResultsState;
  const factory CollectionClipsState.error({required Failure failure}) =
      CollectionClipsErrorState;
}
