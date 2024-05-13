part of 'window_action_cubit.dart';

@freezed
class WindowActionState with _$WindowActionState {
  const factory WindowActionState.loaded({
    @Default(false) bool pinned,
    @Default(false) bool compact,
    @Default(true) bool loading,
  }) = WindowActionLoaded;
}
