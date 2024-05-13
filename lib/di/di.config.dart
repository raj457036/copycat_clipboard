// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i5;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i20;
import 'package:supabase_flutter/supabase_flutter.dart' as _i15;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i14;
import '../bloc/auth_cubit/auth_cubit.dart' as _i19;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i32;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i23;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i30;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i28;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i26;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i22;
import '../bloc/search_cubit/search_cubit.dart' as _i25;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i31;
import '../bloc/window_action_cubit/window_action_cubit.dart' as _i3;
import '../data/repositories/app_config.dart' as _i9;
import '../data/repositories/clip_collection.dart' as _i27;
import '../data/repositories/clipboard.dart' as _i16;
import '../data/repositories/drive_credential.dart' as _i24;
import '../data/repositories/sync_clipboard.dart' as _i17;
import '../data/services/clipboard_service.dart' as _i4;
import '../data/services/google_services.dart' as _i8;
import '../data/sources/clip_collection/clip_collection.dart' as _i12;
import '../data/sources/clip_collection/local_source.dart' as _i13;
import '../data/sources/clip_collection/remote_source.dart' as _i21;
import '../data/sources/clipboard/clipboard.dart' as _i10;
import '../data/sources/clipboard/local_source.dart' as _i11;
import '../data/sources/clipboard/remote_source.dart' as _i18;
import '../db/clip_collection/clipcollection.dart' as _i29;
import '../utils/network_status.dart' as _i7;
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
    gh.factory<_i3.WindowActionCubit>(() => _i3.WindowActionCubit());
    gh.singleton<_i4.ClipboardService>(() => _i4.ClipboardService());
    await gh.lazySingletonAsync<_i5.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i6.closeIsarDb,
    );
    gh.lazySingleton<_i7.NetworkStatus>(
      () => _i7.NetworkStatus(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i8.GoogleOAuth2Service>(() => _i8.GoogleOAuth2Service());
    gh.lazySingleton<_i9.AppConfigRepository>(
        () => _i9.AppConfigRepositoryImpl(gh<_i5.Isar>()));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i10.ClipboardSource>(
      () => _i11.LocalClipboardSource(gh<_i5.Isar>()),
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
    gh.lazySingleton<_i12.ClipCollectionSource>(
      () => _i13.LocalClipCollectionSource(gh<_i5.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i8.DriveService>(
      () => _i8.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i14.AppConfigCubit>(
        () => _i14.AppConfigCubit(gh<_i9.AppConfigRepository>()));
    await gh.singletonAsync<_i15.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i16.ClipboardRepositoryOfflineImpl(
          gh<_i10.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i17.SyncRepository>(
        () => _i17.SyncRepositoryImpl(gh<_i15.SupabaseClient>()));
    gh.lazySingleton<_i10.ClipboardSource>(
      () => _i18.RemoteClipboardSource(gh<_i15.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i19.AuthCubit>(
        () => _i19.AuthCubit(gh<_i20.SupabaseClient>()));
    gh.lazySingleton<_i12.ClipCollectionSource>(
      () => _i21.RemoteClipCollectionSource(gh<_i15.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i22.OfflinePersistanceCubit>(
        () => _i22.OfflinePersistanceCubit(
              gh<_i19.AuthCubit>(),
              gh<_i16.ClipboardRepository>(instanceName: 'offline'),
              gh<_i4.ClipboardService>(),
              gh<_i14.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.factory<_i23.ClipboardCubit>(() => _i23.ClipboardCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          gh<_i5.Isar>(),
        ));
    gh.lazySingleton<_i24.DriveCredentialRepository>(
        () => _i24.DriveCredentialRepositoryImpl(gh<_i20.SupabaseClient>()));
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i16.ClipboardRepositoryCloudImpl(
          gh<_i10.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.factory<_i25.SearchCubit>(() => _i25.SearchCubit(
        gh<_i16.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i26.DriveSetupCubit>(
        () => _i26.DriveSetupCubit(gh<_i24.DriveCredentialRepository>()));
    gh.lazySingleton<_i27.ClipCollectionRepository>(
        () => _i27.ClipCollectionRepositoryImpl(
              gh<_i12.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i12.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.factoryParam<_i28.CollectionClipsCubit, _i29.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i28.CollectionClipsCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.lazySingleton<_i30.CloudPersistanceCubit>(
        () => _i30.CloudPersistanceCubit(
              gh<_i7.NetworkStatus>(),
              gh<_i19.AuthCubit>(),
              gh<_i26.DriveSetupCubit>(),
              gh<_i14.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i16.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i8.DriveService>(instanceName: 'google_drive'),
            ));
    gh.singleton<_i31.SyncManagerCubit>(() => _i31.SyncManagerCubit(
          gh<_i5.Isar>(),
          gh<_i19.AuthCubit>(),
          gh<_i17.SyncRepository>(),
          gh<_i7.NetworkStatus>(),
          gh<_i27.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i32.ClipCollectionCubit>(() => _i32.ClipCollectionCubit(
          gh<_i19.AuthCubit>(),
          gh<_i27.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}
