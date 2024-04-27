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
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i21;
import 'package:supabase_flutter/supabase_flutter.dart' as _i14;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i13;
import '../bloc/auth_cubit/auth_cubit.dart' as _i20;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i24;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i22;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i31;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i29;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i28;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i25;
import '../bloc/search_cubit/search_cubit.dart' as _i27;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i26;
import '../data/repositories/app_config.dart' as _i8;
import '../data/repositories/clip_collection.dart' as _i15;
import '../data/repositories/clipboard.dart' as _i16;
import '../data/repositories/drive_credential.dart' as _i23;
import '../data/repositories/sync_clipboard.dart' as _i19;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/services/google_services.dart' as _i7;
import '../data/sources/clip_collection/clip_collection.dart' as _i11;
import '../data/sources/clip_collection/local_source.dart' as _i12;
import '../data/sources/clip_collection/remote_source.dart' as _i18;
import '../data/sources/clipboard/clipboard.dart' as _i9;
import '../data/sources/clipboard/local_source.dart' as _i10;
import '../data/sources/clipboard/remote_source.dart' as _i17;
import '../db/clip_collection/clipcollection.dart' as _i30;
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
    gh.singleton<_i3.ClipboardService>(() => _i3.ClipboardService());
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
    gh.lazySingleton<_i11.ClipCollectionSource>(
      () => _i12.LocalClipCollectionSource(gh<_i4.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i7.DriveService>(
      () => _i7.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i13.AppConfigCubit>(
        () => _i13.AppConfigCubit(gh<_i8.AppConfigRepository>()));
    await gh.singletonAsync<_i14.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i15.ClipCollectionRepository>(
      () => _i15.ClipCollectionRepositoryOfflineImpl(
          gh<_i11.ClipCollectionSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i16.ClipboardRepositoryOfflineImpl(
          gh<_i9.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i17.RemoteClipboardSource(
        gh<_i14.SupabaseClient>(),
        gh<_i6.NetworkStatus>(),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i11.ClipCollectionSource>(
      () => _i18.RemoteClipCollectionSource(
        gh<_i14.SupabaseClient>(),
        gh<_i6.NetworkStatus>(),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i19.SyncClipboardRepository>(
        () => _i19.SyncClipboardRepositoryImpl(gh<_i14.SupabaseClient>()));
    gh.singleton<_i20.AuthCubit>(() => _i20.AuthCubit(
          gh<_i21.SupabaseClient>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.singleton<_i22.ClipboardCubit>(() => _i22.ClipboardCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          gh<_i4.Isar>(),
        ));
    gh.lazySingleton<_i23.DriveCredentialRepository>(
        () => _i23.DriveCredentialRepositoryImpl(gh<_i21.SupabaseClient>()));
    gh.lazySingleton<_i24.ClipCollectionCubit>(() => _i24.ClipCollectionCubit(
        gh<_i15.ClipCollectionRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i25.OfflinePersistanceCubit>(
        () => _i25.OfflinePersistanceCubit(
              gh<_i20.AuthCubit>(),
              gh<_i16.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
              gh<_i13.AppConfigCubit>(),
            ));
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i16.ClipboardRepositoryCloudImpl(
          gh<_i9.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.singleton<_i26.SyncManagerCubit>(() => _i26.SyncManagerCubit(
          gh<_i4.Isar>(),
          gh<_i20.AuthCubit>(),
          gh<_i19.SyncClipboardRepository>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.factory<_i27.SearchCubit>(() => _i27.SearchCubit(
        gh<_i16.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i28.DriveSetupCubit>(
        () => _i28.DriveSetupCubit(gh<_i23.DriveCredentialRepository>()));
    gh.factoryParam<_i29.CollectionClipsCubit, _i30.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i29.CollectionClipsCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.lazySingleton<_i15.ClipCollectionRepository>(
      () => _i15.ClipCollectionRepositoryCloudImpl(
          gh<_i11.ClipCollectionSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.lazySingleton<_i31.CloudPersistanceCubit>(
        () => _i31.CloudPersistanceCubit(
              gh<_i6.NetworkStatus>(),
              gh<_i20.AuthCubit>(),
              gh<_i28.DriveSetupCubit>(),
              gh<_i13.AppConfigCubit>(),
              gh<_i16.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i7.DriveService>(instanceName: 'google_drive'),
            ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
