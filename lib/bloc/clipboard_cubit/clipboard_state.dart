part of 'clipboard_cubit.dart';

@freezed
class ClipboardState with _$ClipboardState {
  const factory ClipboardState.loaded({
    required List<ClipboardItem> items,
    @Default(true) bool loading,
    Failure? failure,
    @Default(false) bool syncing,
  }) = ClipboardLoadedState;
}
