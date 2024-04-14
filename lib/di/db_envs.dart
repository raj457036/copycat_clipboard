import "package:injectable/injectable.dart";

@module
abstract class AppWriteDbEnvModule {
  @Named("databaseId")
  String get databaseId => "6612ac3373a3890d0907";

  @Named("clipboardCollectionId")
  String get clipboardCollectionId => "661bc1f9787ef90e5000";
}
