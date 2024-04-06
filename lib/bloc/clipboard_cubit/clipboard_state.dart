part of 'clipboard_cubit.dart';

@freezed
class ClipboardState with _$ClipboardState {
  const factory ClipboardState.loaded({
    required List<ClipboardItem> items,
    @Default(true) hasMore,
    @Default(50) int limit,
    @Default(0) int offset,
    @Default(true) bool loading,
    @Default(false) bool syncing,
    Failure? failure,
  }) = ClipboardLoadedState;
}
