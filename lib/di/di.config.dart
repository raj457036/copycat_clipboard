// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:focus_window/focus_window.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i6;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i25;
import 'package:supabase_flutter/supabase_flutter.dart' as _i17;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i16;
import '../bloc/auth_cubit/auth_cubit.dart' as _i32;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i35;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i23;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i34;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i30;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i28;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i36;
import '../bloc/search_cubit/search_cubit.dart' as _i26;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i33;
import '../bloc/window_action_cubit/window_action_cubit.dart' as _i3;
import '../data/repositories/app_config.dart' as _i11;
import '../data/repositories/clip_collection.dart' as _i29;
import '../data/repositories/clipboard.dart' as _i18;
import '../data/repositories/drive_credential.dart' as _i24;
import '../data/repositories/subscription.dart' as _i27;
import '../data/repositories/sync_clipboard.dart' as _i19;
import '../data/services/clipboard_service.dart' as _i5;
import '../data/services/google_services.dart' as _i8;
import '../data/sources/clip_collection/clip_collection.dart' as _i14;
import '../data/sources/clip_collection/local_source.dart' as _i15;
import '../data/sources/clip_collection/remote_source.dart' as _i22;
import '../data/sources/clipboard/clipboard.dart' as _i12;
import '../data/sources/clipboard/local_source.dart' as _i13;
import '../data/sources/clipboard/remote_source.dart' as _i20;
import '../data/sources/subscription/local_source.dart' as _i10;
import '../data/sources/subscription/remote_source.dart' as _i21;
import '../data/sources/subscription/subscription.dart' as _i9;
import '../db/clip_collection/clipcollection.dart' as _i31;
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
    gh.factory<_i3.WindowActionCubit>(() => _i3.WindowActionCubit());
    gh.singleton<_i4.FocusWindow>(() => registerModule.focusWindow);
    gh.singleton<_i5.ClipboardService>(() => _i5.ClipboardService());
    await gh.lazySingletonAsync<_i6.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i7.closeIsarDb,
    );
    gh.lazySingleton<_i8.GoogleOAuth2Service>(() => _i8.GoogleOAuth2Service());
    gh.lazySingleton<_i9.SubscriptionSource>(
      () => _i10.LocalSubscriptionSource(db: gh<_i6.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i11.AppConfigRepository>(
        () => _i11.AppConfigRepositoryImpl(gh<_i6.Isar>()));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i12.ClipboardSource>(
      () => _i13.LocalClipboardSource(gh<_i6.Isar>()),
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
    gh.lazySingleton<_i14.ClipCollectionSource>(
      () => _i15.LocalClipCollectionSource(gh<_i6.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i8.DriveService>(
      () => _i8.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i16.AppConfigCubit>(
        () => _i16.AppConfigCubit(gh<_i11.AppConfigRepository>()));
    await gh.singletonAsync<_i17.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i18.ClipboardRepository>(
      () => _i18.ClipboardRepositoryOfflineImpl(
          gh<_i12.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i19.SyncRepository>(
        () => _i19.SyncRepositoryImpl(gh<_i17.SupabaseClient>()));
    gh.lazySingleton<_i12.ClipboardSource>(
      () => _i20.RemoteClipboardSource(gh<_i17.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i9.SubscriptionSource>(
      () => _i21.RemoteSubscriptionSource(client: gh<_i17.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i14.ClipCollectionSource>(
      () => _i22.RemoteClipCollectionSource(gh<_i17.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.factory<_i23.ClipboardCubit>(() => _i23.ClipboardCubit(
          gh<_i18.ClipboardRepository>(instanceName: 'offline'),
          gh<_i6.Isar>(),
        ));
    gh.lazySingleton<_i24.DriveCredentialRepository>(
        () => _i24.DriveCredentialRepositoryImpl(gh<_i25.SupabaseClient>()));
    gh.lazySingleton<_i18.ClipboardRepository>(
      () => _i18.ClipboardRepositoryCloudImpl(
          gh<_i12.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.factory<_i26.SearchCubit>(() => _i26.SearchCubit(
        gh<_i18.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i27.SubscriptionRepository>(
        () => _i27.SubscriptionRepositoryImpl(
              client: gh<_i17.SupabaseClient>(),
              local: gh<_i9.SubscriptionSource>(instanceName: 'local'),
              remote: gh<_i9.SubscriptionSource>(instanceName: 'remote'),
            ));
    gh.lazySingleton<_i28.DriveSetupCubit>(
        () => _i28.DriveSetupCubit(gh<_i24.DriveCredentialRepository>()));
    gh.lazySingleton<_i29.ClipCollectionRepository>(
        () => _i29.ClipCollectionRepositoryImpl(
              gh<_i14.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i14.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.factoryParam<_i30.CollectionClipsCubit, _i31.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i30.CollectionClipsCubit(
          gh<_i18.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.singleton<_i32.AuthCubit>(() => _i32.AuthCubit(
          gh<_i17.SupabaseClient>(),
          gh<_i27.SubscriptionRepository>(),
        ));
    gh.singleton<_i33.SyncManagerCubit>(() => _i33.SyncManagerCubit(
          gh<_i6.Isar>(),
          gh<_i32.AuthCubit>(),
          gh<_i19.SyncRepository>(),
          gh<_i29.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i34.CloudPersistanceCubit>(
        () => _i34.CloudPersistanceCubit(
              gh<_i32.AuthCubit>(),
              gh<_i28.DriveSetupCubit>(),
              gh<_i16.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i18.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i8.DriveService>(instanceName: 'google_drive'),
            ));
    gh.lazySingleton<_i35.ClipCollectionCubit>(() => _i35.ClipCollectionCubit(
          gh<_i32.AuthCubit>(),
          gh<_i29.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i36.OfflinePersistanceCubit>(
        () => _i36.OfflinePersistanceCubit(
              gh<_i32.AuthCubit>(),
              gh<_i18.ClipboardRepository>(instanceName: 'offline'),
              gh<_i5.ClipboardService>(),
              gh<_i16.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
            ));
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
