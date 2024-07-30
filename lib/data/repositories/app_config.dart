import 'package:copycat_base/common/failure.dart';
import 'package:copycat_base/db/app_config/appconfig.dart';
import 'package:copycat_base/domain/repositories/app_config.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@LazySingleton(as: AppConfigRepository)
class AppConfigRepositoryImpl implements AppConfigRepository {
  final Isar db;
  final _fixedId = 1;

  AppConfigRepositoryImpl(this.db);

  Future<AppConfig> create() async {
    final appConfig = AppConfig();
    appConfig.id = _fixedId;
    await db.writeTxn(
      () async => await db.appConfigs.put(appConfig),
    );
    return appConfig;
  }

  @override
  FailureOr<AppConfig> get() async {
    try {
      final result = await db.appConfigs.get(_fixedId);
      if (result == null) {
        final result = await create();
        return Right(result);
      }
      return Right(result);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  FailureOr<AppConfig> update(AppConfig config) async {
    try {
      await db.writeTxn(
        () async => await db.appConfigs.put(config),
      );
      return Right(config);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
