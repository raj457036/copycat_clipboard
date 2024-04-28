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
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i19;
import 'package:supabase_flutter/supabase_flutter.dart' as _i14;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i13;
import '../bloc/auth_cubit/auth_cubit.dart' as _i18;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i30;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i21;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i29;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i27;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i25;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i23;
import '../bloc/search_cubit/search_cubit.dart' as _i24;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i31;
import '../data/repositories/app_config.dart' as _i8;
import '../data/repositories/clip_collection.dart' as _i26;
import '../data/repositories/clipboard.dart' as _i15;
import '../data/repositories/drive_credential.dart' as _i22;
import '../data/repositories/sync_clipboard.dart' as _i16;
import '../data/services/clipboard_service.dart' as _i3;
import '../data/services/google_services.dart' as _i7;
import '../data/sources/clip_collection/clip_collection.dart' as _i11;
import '../data/sources/clip_collection/local_source.dart' as _i12;
import '../data/sources/clip_collection/remote_source.dart' as _i20;
import '../data/sources/clipboard/clipboard.dart' as _i9;
import '../data/sources/clipboard/local_source.dart' as _i10;
import '../data/sources/clipboard/remote_source.dart' as _i17;
import '../db/clip_collection/clipcollection.dart' as _i28;
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
    gh.lazySingleton<_i15.ClipboardRepository>(
      () => _i15.ClipboardRepositoryOfflineImpl(
          gh<_i9.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i16.SyncRepository>(
        () => _i16.SyncRepositoryImpl(gh<_i14.SupabaseClient>()));
    gh.lazySingleton<_i9.ClipboardSource>(
      () => _i17.RemoteClipboardSource(gh<_i14.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i18.AuthCubit>(() => _i18.AuthCubit(
          gh<_i19.SupabaseClient>(),
          gh<_i6.NetworkStatus>(),
        ));
    gh.lazySingleton<_i11.ClipCollectionSource>(
      () => _i20.RemoteClipCollectionSource(gh<_i14.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i21.ClipboardCubit>(() => _i21.ClipboardCubit(
          gh<_i15.ClipboardRepository>(instanceName: 'offline'),
          gh<_i4.Isar>(),
        ));
    gh.lazySingleton<_i22.DriveCredentialRepository>(
        () => _i22.DriveCredentialRepositoryImpl(gh<_i19.SupabaseClient>()));
    gh.lazySingleton<_i23.OfflinePersistanceCubit>(
        () => _i23.OfflinePersistanceCubit(
              gh<_i18.AuthCubit>(),
              gh<_i15.ClipboardRepository>(instanceName: 'offline'),
              gh<_i3.ClipboardService>(),
              gh<_i13.AppConfigCubit>(),
            ));
    gh.lazySingleton<_i15.ClipboardRepository>(
      () => _i15.ClipboardRepositoryCloudImpl(
          gh<_i9.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.factory<_i24.SearchCubit>(() => _i24.SearchCubit(
        gh<_i15.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i25.DriveSetupCubit>(
        () => _i25.DriveSetupCubit(gh<_i22.DriveCredentialRepository>()));
    gh.lazySingleton<_i26.ClipCollectionRepository>(
        () => _i26.ClipCollectionRepositoryImpl(
              gh<_i11.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i11.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.factoryParam<_i27.CollectionClipsCubit, _i28.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i27.CollectionClipsCubit(
          gh<_i15.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.lazySingleton<_i29.CloudPersistanceCubit>(
        () => _i29.CloudPersistanceCubit(
              gh<_i6.NetworkStatus>(),
              gh<_i18.AuthCubit>(),
              gh<_i25.DriveSetupCubit>(),
              gh<_i13.AppConfigCubit>(),
              gh<_i15.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i7.DriveService>(instanceName: 'google_drive'),
            ));
    gh.lazySingleton<_i30.ClipCollectionCubit>(() => _i30.ClipCollectionCubit(
          gh<_i18.AuthCubit>(),
          gh<_i26.ClipCollectionRepository>(),
        ));
    gh.singleton<_i31.SyncManagerCubit>(() => _i31.SyncManagerCubit(
          gh<_i4.Isar>(),
          gh<_i18.AuthCubit>(),
          gh<_i16.SyncRepository>(),
          gh<_i6.NetworkStatus>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
