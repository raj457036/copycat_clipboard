// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i12;
import '../bloc/auth_cubit/auth_cubit.dart' as _i11;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i18;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i15;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i17;
import '../data/repositories/app_config.dart' as _i8;
import '../data/repositories/clipboard.dart' as _i13;
import '../data/repositories/sync_clipboard.dart' as _i16;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/sources/clipboard/clipboard.dart' as _i9;
import '../data/sources/clipboard/local_source.dart' as _i10;
import '../data/sources/clipboard/remote_source.dart' as _i14;
import '../utils/network_status.dart' as _i7;
import 'db_envs.dart' as _i19;
import 'modules.dart' as _i6;

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
    gh.factory<_i3.ClipboardService>(() => _i3.ClipboardService());
    gh.singleton<_i4.Client>(() => registerModule.client);
    await gh.lazySingletonAsync<_i5.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i6.closeIsarDb,
    );
    gh.lazySingleton<_i7.NetworkStatus>(
      () => _i7.NetworkStatus(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i8.AppConfigRepository>(
        () => _i8.AppConfigRepositoryImpl(gh<_i5.Isar>()));
    gh.lazySingleton<_i4.Account>(
        () => registerModule.account(gh<_i4.Client>()));
    gh.lazySingleton<_i4.Databases>(
        () => registerModule.database(gh<_i4.Client>()));
    gh.factory<String>(
      () => appWriteDbEnvModule.databaseId,
      instanceName: 'databaseId',
    );
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i10.LocalClipboardSource(gh<_i5.Isar>()),
      instanceName: 'local',
    );
    gh.factory<String>(
      () => appWriteDbEnvModule.clipboardCollectionId,
      instanceName: 'clipboardCollectionId',
    );
    gh.singleton<_i11.AuthCubit>(() => _i11.AuthCubit(gh<_i4.Account>()));
    gh.singleton<_i12.AppConfigCubit>(
        () => _i12.AppConfigCubit(gh<_i8.AppConfigRepository>()));
    gh.lazySingleton<_i13.ClipboardRepository>(
      () => _i13.ClipboardRepositoryOfflineImpl(
          gh<_i9.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i14.RemoteClipboardSource(
        gh<_i4.Databases>(),
        gh<_i7.NetworkStatus>(),
        gh<String>(instanceName: 'databaseId'),
        gh<String>(instanceName: 'clipboardCollectionId'),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i15.OfflinePersistanceCubit>(
        () => _i15.OfflinePersistanceCubit(
              gh<_i11.AuthCubit>(),
              gh<_i13.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
            ));
    gh.lazySingleton<_i16.SyncClipboardRepository>(
        () => _i16.SyncClipboardRepositoryImpl(
              gh<_i4.Databases>(),
              gh<String>(instanceName: 'databaseId'),
              gh<String>(instanceName: 'clipboardCollectionId'),
            ));
    gh.singleton<_i17.SyncManagerCubit>(() => _i17.SyncManagerCubit(
          gh<_i5.Isar>(),
          gh<_i11.AuthCubit>(),
          gh<_i16.SyncClipboardRepository>(),
          gh<_i7.NetworkStatus>(),
        ));
    gh.singleton<_i18.ClipboardCubit>(() => _i18.ClipboardCubit(
        gh<_i13.ClipboardRepository>(instanceName: 'offline')));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}

class _$AppWriteDbEnvModule extends _i19.AppWriteDbEnvModule {}
