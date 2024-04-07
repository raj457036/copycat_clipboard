// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i13;
import '../bloc/auth_cubit/auth_cubit.dart' as _i11;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i14;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i7;
import '../data/repositories/app_config.dart' as _i6;
import '../data/repositories/clipboard.dart' as _i12;
import '../data/sources/clipboard/clipboard.dart' as _i8;
import '../data/sources/clipboard/local_source.dart' as _i9;
import '../data/sources/clipboard/remote_source.dart' as _i10;
import 'db_envs.dart' as _i15;
import 'modules.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    final appWriteDbEnvModule = _$AppWriteDbEnvModule();
    gh.singleton<_i3.Client>(() => registerModule.client);
    await gh.lazySingletonAsync<_i4.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i5.closeIsarDb,
    );
    gh.lazySingleton<_i6.AppConfigRepository>(
        () => _i6.AppConfigRepositoryImpl(gh<_i4.Isar>()));
    gh.singleton<_i7.SyncManagerCubit>(
        () => _i7.SyncManagerCubit(gh<_i4.Isar>()));
    gh.lazySingleton<_i3.Account>(
        () => registerModule.account(gh<_i3.Client>()));
    gh.lazySingleton<_i3.Databases>(
        () => registerModule.database(gh<_i3.Client>()));
    gh.factory<String>(
      () => appWriteDbEnvModule.databaseId,
      instanceName: 'databaseId',
    );
    gh.lazySingleton<_i8.ClipboardSource>(
      () => _i9.LocalClipboardSource(gh<_i4.Isar>()),
      instanceName: 'local',
    );
    gh.factory<String>(
      () => appWriteDbEnvModule.clipboardCollectionId,
      instanceName: 'clipboardCollectionId',
    );
    gh.lazySingleton<_i8.ClipboardSource>(
      () => _i10.RemoteClipboardSource(
        gh<_i3.Databases>(),
        gh<String>(instanceName: 'databaseId'),
        gh<String>(instanceName: 'clipboardCollectionId'),
      ),
      instanceName: 'remote',
    );
    gh.singleton<_i11.AuthCubit>(() => _i11.AuthCubit(gh<_i3.Account>()));
    gh.lazySingleton<_i12.ClipboardRepository>(() =>
        _i12.ClipboardRepositoryImpl(
            gh<_i8.ClipboardSource>(instanceName: 'local')));
    gh.singleton<_i13.AppConfigCubit>(
        () => _i13.AppConfigCubit(gh<_i6.AppConfigRepository>()));
    gh.factory<_i14.ClipboardCubit>(() => _i14.ClipboardCubit(
          gh<_i12.ClipboardRepository>(),
          gh<_i11.AuthCubit>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}

class _$AppWriteDbEnvModule extends _i15.AppWriteDbEnvModule {}
