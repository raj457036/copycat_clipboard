part of 'clip_collection_cubit.dart';

@freezed
sealed class ClipCollectionState with _$ClipCollectionState {
  const factory ClipCollectionState.initial() = ClipCollectionInitial;

  const factory ClipCollectionState.error(Failure failure) =
      ClipCollectionError;

  const factory ClipCollectionState.loaded({
    required List<ClipCollection> collections,
    @Default(true) bool hasMore,
    @Default(false) bool isLoading,
    @Default(50) int limit,
    @Default(0) int offset,
  }) = ClipCollectionLoaded;
}
