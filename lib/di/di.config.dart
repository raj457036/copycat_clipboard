// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i6;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i19;
import 'package:supabase_flutter/supabase_flutter.dart' as _i14;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i13;
import '../bloc/auth_cubit/auth_cubit.dart' as _i18;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i20;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i22;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i5;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i23;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i21;
import '../data/repositories/app_config.dart' as _i10;
import '../data/repositories/clipboard.dart' as _i15;
import '../data/repositories/sync_clipboard.dart' as _i17;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/services/google_drive_connect.dart' as _i4;
import '../data/services/google_services.dart' as _i9;
import '../data/sources/clipboard/clipboard.dart' as _i11;
import '../data/sources/clipboard/local_source.dart' as _i12;
import '../data/sources/clipboard/remote_source.dart' as _i16;
import '../utils/network_status.dart' as _i8;
import 'modules.dart' as _i7;

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
    gh.factory<_i3.ClipboardService>(() => _i3.ClipboardService());
    gh.factory<_i4.GoogleDriveConnect>(() => _i4.GoogleDriveConnect());
    gh.factory<_i5.DriveSetupCubit>(() => _i5.DriveSetupCubit());
    await gh.lazySingletonAsync<_i6.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i7.closeIsarDb,
    );
    gh.lazySingleton<_i8.NetworkStatus>(
      () => _i8.NetworkStatus(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i9.GoogleOAuth2Service>(() => _i9.GoogleOAuth2Service());
    gh.lazySingleton<_i10.AppConfigRepository>(
        () => _i10.AppConfigRepositoryImpl(gh<_i6.Isar>()));
    gh.lazySingleton<_i11.ClipboardSource>(
      () => _i12.LocalClipboardSource(gh<_i6.Isar>()),
      instanceName: 'local',
    );
    gh.factory<String>(
      () => registerModule.supabaseUrl,
      instanceName: 'supabase_url',
    );
    gh.factory<String>(
      () => registerModule.supabaseKey,
      instanceName: 'supabase_key',
    );
    gh.lazySingleton<_i9.DriveService>(
      () => _i9.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i13.AppConfigCubit>(
        () => _i13.AppConfigCubit(gh<_i10.AppConfigRepository>()));
    await gh.singletonAsync<_i14.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i15.ClipboardRepository>(
      () => _i15.ClipboardRepositoryOfflineImpl(
          gh<_i11.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i11.ClipboardSource>(
      () => _i16.RemoteClipboardSource(
        gh<_i14.SupabaseClient>(),
        gh<_i8.NetworkStatus>(),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i17.SyncClipboardRepository>(
        () => _i17.SyncClipboardRepositoryImpl(gh<_i14.SupabaseClient>()));
    gh.singleton<_i18.AuthCubit>(() => _i18.AuthCubit(
          gh<_i19.SupabaseClient>(),
          gh<_i8.NetworkStatus>(),
        ));
    gh.singleton<_i20.ClipboardCubit>(() => _i20.ClipboardCubit(
          gh<_i15.ClipboardRepository>(instanceName: 'offline'),
          gh<_i6.Isar>(),
        ));
    gh.lazySingleton<_i15.ClipboardRepository>(
      () => _i15.ClipboardRepositoryCloudImpl(
          gh<_i11.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.singleton<_i21.SyncManagerCubit>(() => _i21.SyncManagerCubit(
          gh<_i6.Isar>(),
          gh<_i18.AuthCubit>(),
          gh<_i17.SyncClipboardRepository>(),
          gh<_i8.NetworkStatus>(),
        ));
    gh.factory<_i22.CloudPersistanceCubit>(() => _i22.CloudPersistanceCubit(
          gh<_i8.NetworkStatus>(),
          gh<_i18.AuthCubit>(),
          gh<_i4.GoogleDriveConnect>(),
          gh<_i15.ClipboardRepository>(instanceName: 'cloud'),
          gh<_i9.DriveService>(instanceName: 'google_drive'),
        ));
    gh.lazySingleton<_i23.OfflinePersistanceCubit>(
        () => _i23.OfflinePersistanceCubit(
              gh<_i18.AuthCubit>(),
              gh<_i15.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
            ));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
