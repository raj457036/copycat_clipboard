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

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i11;
import '../bloc/auth_cubit/auth_cubit.dart' as _i10;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i17;
import '../bloc/gdrive_sync_cubit/gdrive_sync_cubit.dart' as _i12;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i15;
import '../data/repositories/app_config.dart' as _i7;
import '../data/repositories/clipboard.dart' as _i16;
import '../data/repositories/sync_clipboard.dart' as _i14;
import '../data/sources/clipboard/clipboard.dart' as _i8;
import '../data/sources/clipboard/local_source.dart' as _i9;
import '../data/sources/clipboard/remote_source.dart' as _i13;
import '../utils/network_status.dart' as _i6;
import 'db_envs.dart' as _i18;
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
    gh.lazySingleton<_i6.NetworkStatus>(
      () => _i6.NetworkStatus(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i7.AppConfigRepository>(
        () => _i7.AppConfigRepositoryImpl(gh<_i4.Isar>()));
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
    gh.singleton<_i10.AuthCubit>(() => _i10.AuthCubit(gh<_i3.Account>()));
    gh.singleton<_i11.AppConfigCubit>(
        () => _i11.AppConfigCubit(gh<_i7.AppConfigRepository>()));
    gh.singleton<_i12.GdriveSyncCubit>(
        () => _i12.GdriveSyncCubit(gh<_i10.AuthCubit>()));
    gh.lazySingleton<_i8.ClipboardSource>(
      () => _i13.RemoteClipboardSource(
        gh<_i3.Databases>(),
        gh<_i6.NetworkStatus>(),
        gh<String>(instanceName: 'databaseId'),
        gh<String>(instanceName: 'clipboardCollectionId'),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i14.SyncClipboardRepository>(
        () => _i14.SyncClipboardRepositoryImpl(
              gh<_i3.Databases>(),
              gh<String>(instanceName: 'databaseId'),
              gh<String>(instanceName: 'clipboardCollectionId'),
            ));
    gh.singleton<_i15.SyncManagerCubit>(() => _i15.SyncManagerCubit(
          gh<_i4.Isar>(),
          gh<_i10.AuthCubit>(),
          gh<_i14.SyncClipboardRepository>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.lazySingleton<_i16.ClipboardRepository>(
        () => _i16.ClipboardRepositoryImpl(
              gh<_i8.ClipboardSource>(instanceName: 'local'),
              gh<_i8.ClipboardSource>(instanceName: 'remote'),
            ));
    gh.singleton<_i17.ClipboardCubit>(() => _i17.ClipboardCubit(
          gh<_i16.ClipboardRepository>(),
          gh<_i10.AuthCubit>(),
          gh<_i15.SyncManagerCubit>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}

class _$AppWriteDbEnvModule extends _i18.AppWriteDbEnvModule {}
