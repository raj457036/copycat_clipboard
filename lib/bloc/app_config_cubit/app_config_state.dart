part of 'app_config_cubit.dart';

@freezed
class AppConfigState with _$AppConfigState {
  const factory AppConfigState.initial() = AppConfigLoading;
  const factory AppConfigState.loaded({
    required AppConfig config,
  }) = AppConfigLoaded;
  const factory AppConfigState.error({
    required Failure failure,
  }) = AppConfigError;
}
