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

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i13;
import '../bloc/auth_cubit/auth_cubit.dart' as _i12;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i19;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i20;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i16;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i18;
import '../data/repositories/app_config.dart' as _i9;
import '../data/repositories/clipboard.dart' as _i14;
import '../data/repositories/sync_clipboard.dart' as _i17;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/services/drive_service.dart' as _i8;
import '../data/sources/clipboard/clipboard.dart' as _i10;
import '../data/sources/clipboard/local_source.dart' as _i11;
import '../data/sources/clipboard/remote_source.dart' as _i15;
import '../utils/network_status.dart' as _i7;
import 'db_envs.dart' as _i21;
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
    gh.lazySingleton<_i8.DriveService>(
      () => _i8.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i9.AppConfigRepository>(
        () => _i9.AppConfigRepositoryImpl(gh<_i5.Isar>()));
    gh.lazySingleton<_i4.Account>(
        () => registerModule.account(gh<_i4.Client>()));
    gh.lazySingleton<_i4.Databases>(
        () => registerModule.database(gh<_i4.Client>()));
    gh.factory<String>(
      () => appWriteDbEnvModule.databaseId,
      instanceName: 'databaseId',
    );
    gh.lazySingleton<_i10.ClipboardSource>(
      () => _i11.LocalClipboardSource(gh<_i5.Isar>()),
      instanceName: 'local',
    );
    gh.factory<String>(
      () => appWriteDbEnvModule.clipboardCollectionId,
      instanceName: 'clipboardCollectionId',
    );
    gh.singleton<_i12.AuthCubit>(() => _i12.AuthCubit(gh<_i4.Account>()));
    gh.singleton<_i13.AppConfigCubit>(
        () => _i13.AppConfigCubit(gh<_i9.AppConfigRepository>()));
    gh.lazySingleton<_i14.ClipboardRepository>(
      () => _i14.ClipboardRepositoryOfflineImpl(
          gh<_i10.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i10.ClipboardSource>(
      () => _i15.RemoteClipboardSource(
        gh<_i4.Databases>(),
        gh<_i7.NetworkStatus>(),
        gh<String>(instanceName: 'databaseId'),
        gh<String>(instanceName: 'clipboardCollectionId'),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i16.OfflinePersistanceCubit>(
        () => _i16.OfflinePersistanceCubit(
              gh<_i12.AuthCubit>(),
              gh<_i14.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
            ));
    gh.lazySingleton<_i17.SyncClipboardRepository>(
        () => _i17.SyncClipboardRepositoryImpl(
              gh<_i4.Databases>(),
              gh<String>(instanceName: 'databaseId'),
              gh<String>(instanceName: 'clipboardCollectionId'),
            ));
    gh.lazySingleton<_i14.ClipboardRepository>(
      () => _i14.ClipboardRepositoryCloudImpl(
          gh<_i10.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.singleton<_i18.SyncManagerCubit>(() => _i18.SyncManagerCubit(
          gh<_i5.Isar>(),
          gh<_i12.AuthCubit>(),
          gh<_i17.SyncClipboardRepository>(),
          gh<_i7.NetworkStatus>(),
        ));
    gh.singleton<_i19.ClipboardCubit>(() => _i19.ClipboardCubit(
        gh<_i14.ClipboardRepository>(instanceName: 'offline')));
    gh.factory<_i20.CloudPersistanceCubit>(() => _i20.CloudPersistanceCubit(
          gh<_i7.NetworkStatus>(),
          gh<_i12.AuthCubit>(),
          gh<_i14.ClipboardRepository>(instanceName: 'cloud'),
          gh<_i8.DriveService>(instanceName: 'google_drive'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}

class _$AppWriteDbEnvModule extends _i21.AppWriteDbEnvModule {}
