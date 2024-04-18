// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i17;
import 'package:supabase_flutter/supabase_flutter.dart' as _i12;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i11;
import '../bloc/auth_cubit/auth_cubit.dart' as _i16;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i18;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i23;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i21;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i22;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i20;
import '../data/repositories/app_config.dart' as _i8;
import '../data/repositories/clipboard.dart' as _i13;
import '../data/repositories/drive_credential.dart' as _i19;
import '../data/repositories/sync_clipboard.dart' as _i15;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/services/google_services.dart' as _i7;
import '../data/sources/clipboard/clipboard.dart' as _i9;
import '../data/sources/clipboard/local_source.dart' as _i10;
import '../data/sources/clipboard/remote_source.dart' as _i14;
import '../utils/network_status.dart' as _i6;
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
    gh.factory<_i3.ClipboardService>(() => _i3.ClipboardService());
    await gh.lazySingletonAsync<_i4.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i5.closeIsarDb,
    );
    gh.lazySingleton<_i6.NetworkStatus>(
      () => _i6.NetworkStatus(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i7.GoogleOAuth2Service>(() => _i7.GoogleOAuth2Service());
    gh.lazySingleton<_i8.AppConfigRepository>(
        () => _i8.AppConfigRepositoryImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i10.LocalClipboardSource(gh<_i4.Isar>()),
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
    gh.lazySingleton<_i7.DriveService>(
      () => _i7.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i11.AppConfigCubit>(
        () => _i11.AppConfigCubit(gh<_i8.AppConfigRepository>()));
    await gh.singletonAsync<_i12.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i13.ClipboardRepository>(
      () => _i13.ClipboardRepositoryOfflineImpl(
          gh<_i9.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i14.RemoteClipboardSource(
        gh<_i12.SupabaseClient>(),
        gh<_i6.NetworkStatus>(),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i15.SyncClipboardRepository>(
        () => _i15.SyncClipboardRepositoryImpl(gh<_i12.SupabaseClient>()));
    gh.singleton<_i16.AuthCubit>(() => _i16.AuthCubit(
          gh<_i17.SupabaseClient>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.singleton<_i18.ClipboardCubit>(() => _i18.ClipboardCubit(
          gh<_i13.ClipboardRepository>(instanceName: 'offline'),
          gh<_i4.Isar>(),
        ));
    gh.lazySingleton<_i19.DriveCredentialRepository>(
        () => _i19.DriveCredentialRepositoryImpl(gh<_i17.SupabaseClient>()));
    gh.lazySingleton<_i13.ClipboardRepository>(
      () => _i13.ClipboardRepositoryCloudImpl(
          gh<_i9.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.singleton<_i20.SyncManagerCubit>(() => _i20.SyncManagerCubit(
          gh<_i4.Isar>(),
          gh<_i16.AuthCubit>(),
          gh<_i15.SyncClipboardRepository>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.factory<_i21.DriveSetupCubit>(
        () => _i21.DriveSetupCubit(gh<_i19.DriveCredentialRepository>()));
    gh.lazySingleton<_i22.OfflinePersistanceCubit>(
        () => _i22.OfflinePersistanceCubit(
              gh<_i16.AuthCubit>(),
              gh<_i13.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
            ));
    gh.factory<_i23.CloudPersistanceCubit>(() => _i23.CloudPersistanceCubit(
          gh<_i6.NetworkStatus>(),
          gh<_i16.AuthCubit>(),
          gh<_i13.ClipboardRepository>(instanceName: 'cloud'),
          gh<_i7.DriveService>(instanceName: 'google_drive'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
