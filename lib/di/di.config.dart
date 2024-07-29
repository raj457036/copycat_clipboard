// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:copycat_base/data/repositories/app_config.dart' as _i12;
import 'package:copycat_base/data/repositories/clip_collection.dart' as _i35;
import 'package:copycat_base/data/repositories/clipboard.dart' as _i16;
import 'package:copycat_base/data/services/google_services.dart' as _i11;
import 'package:copycat_base/data/sources/clip_collection.dart' as _i18;
import 'package:copycat_base/data/sources/clipboard.dart' as _i14;
import 'package:copycat_base/data/sources/subscription.dart' as _i31;
import 'package:copycat_base/db/clip_collection/clipcollection.dart' as _i24;
import 'package:focus_window/focus_window.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i8;
import 'package:package_info_plus/package_info_plus.dart' as _i3;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i34;
import 'package:supabase_flutter/supabase_flutter.dart' as _i22;
import 'package:tiny_storage/tiny_storage.dart' as _i6;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i25;
import '../bloc/auth_cubit/auth_cubit.dart' as _i27;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i40;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i20;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i42;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i23;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i37;
import '../bloc/monetization_cubit/monetization_cubit.dart' as _i39;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i30;
import '../bloc/search_cubit/search_cubit.dart' as _i21;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i41;
import '../bloc/window_action_cubit/window_action_cubit.dart' as _i4;
import '../data/repositories/app_config.dart' as _i13;
import '../data/repositories/clip_collection.dart' as _i36;
import '../data/repositories/clipboard.dart' as _i17;
import '../data/repositories/drive_credential.dart' as _i33;
import '../data/repositories/subscription.dart' as _i38;
import '../data/repositories/sync_clipboard.dart' as _i28;
import '../data/services/clipboard_service.dart' as _i7;
import '../data/services/google_drive_service.dart' as _i10;
import '../data/sources/clip_collection/local_source.dart' as _i19;
import '../data/sources/clip_collection/remote_source.dart' as _i29;
import '../data/sources/clipboard/local_source.dart' as _i15;
import '../data/sources/clipboard/remote_source.dart' as _i26;
import '../data/sources/subscription/remote_source.dart' as _i32;
import 'modules.dart' as _i9;

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
    await gh.factoryAsync<_i3.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    gh.factory<_i4.WindowActionCubit>(() => _i4.WindowActionCubit());
    gh.singleton<_i5.FocusWindow>(() => registerModule.focusWindow);
    await gh.singletonAsync<_i6.TinyStorage>(
      () => registerModule.localCache(),
      preResolve: true,
    );
    gh.singleton<_i7.ClipboardService>(() => _i7.ClipboardService());
    await gh.lazySingletonAsync<_i8.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i9.closeIsarDb,
    );
    gh.lazySingleton<_i10.GoogleOAuth2Service>(
        () => _i10.GoogleOAuth2Service());
    gh.lazySingleton<_i11.DriveService>(
      () => _i10.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i12.AppConfigRepository>(
        () => _i13.AppConfigRepositoryImpl(gh<_i8.Isar>()));
    gh.lazySingleton<_i14.ClipboardSource>(
      () => _i15.LocalClipboardSource(gh<_i8.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i17.ClipboardRepositoryOfflineImpl(
          gh<_i14.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i18.ClipCollectionSource>(
      () => _i19.LocalClipCollectionSource(gh<_i8.Isar>()),
      instanceName: 'local',
    );
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.factory<String>(
      () => registerModule.supabaseUrl,
      instanceName: 'supabase_url',
    );
    gh.factory<_i20.ClipboardCubit>(() => _i20.ClipboardCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          gh<_i8.Isar>(),
        ));
    gh.factory<String>(
      () => registerModule.supabaseKey,
      instanceName: 'supabase_key',
    );
    gh.factory<_i21.SearchCubit>(() => _i21.SearchCubit(
        gh<_i16.ClipboardRepository>(instanceName: 'offline')));
    await gh.singletonAsync<_i22.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.factoryParam<_i23.CollectionClipsCubit, _i24.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i23.CollectionClipsCubit(
          gh<_i16.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.singleton<_i25.AppConfigCubit>(
        () => _i25.AppConfigCubit(gh<_i12.AppConfigRepository>()));
    gh.lazySingleton<_i14.ClipboardSource>(
      () => _i26.RemoteClipboardSource(gh<_i22.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i27.AuthCubit>(() => _i27.AuthCubit(
          gh<_i22.SupabaseClient>(),
          gh<_i6.TinyStorage>(),
        ));
    gh.lazySingleton<_i28.SyncRepository>(
        () => _i28.SyncRepositoryImpl(gh<_i22.SupabaseClient>()));
    gh.lazySingleton<_i18.ClipCollectionSource>(
      () => _i29.RemoteClipCollectionSource(gh<_i22.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i30.OfflinePersistanceCubit>(
        () => _i30.OfflinePersistanceCubit(
              gh<_i27.AuthCubit>(),
              gh<_i16.ClipboardRepository>(instanceName: 'offline'),
              gh<_i7.ClipboardService>(),
              gh<_i25.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.lazySingleton<_i31.SubscriptionSource>(
      () => _i32.RemoteSubscriptionSource(client: gh<_i22.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i16.ClipboardRepository>(
      () => _i17.ClipboardRepositoryCloudImpl(
          gh<_i14.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.lazySingleton<_i33.DriveCredentialRepository>(
        () => _i33.DriveCredentialRepositoryImpl(gh<_i34.SupabaseClient>()));
    gh.lazySingleton<_i35.ClipCollectionRepository>(
        () => _i36.ClipCollectionRepositoryImpl(
              gh<_i18.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i18.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.lazySingleton<_i37.DriveSetupCubit>(
        () => _i37.DriveSetupCubit(gh<_i33.DriveCredentialRepository>()));
    gh.lazySingleton<_i38.SubscriptionRepository>(
        () => _i38.SubscriptionRepositoryImpl(
              client: gh<_i22.SupabaseClient>(),
              remote: gh<_i31.SubscriptionSource>(instanceName: 'remote'),
            ));
    gh.singleton<_i39.MonetizationCubit>(
        () => _i39.MonetizationCubit(gh<_i38.SubscriptionRepository>()));
    gh.lazySingleton<_i40.ClipCollectionCubit>(() => _i40.ClipCollectionCubit(
          gh<_i27.AuthCubit>(),
          gh<_i35.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.singleton<_i41.SyncManagerCubit>(() => _i41.SyncManagerCubit(
          gh<_i8.Isar>(),
          gh<_i27.AuthCubit>(),
          gh<_i28.SyncRepository>(),
          gh<_i35.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i42.CloudPersistanceCubit>(
        () => _i42.CloudPersistanceCubit(
              gh<_i27.AuthCubit>(),
              gh<_i37.DriveSetupCubit>(),
              gh<_i25.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i16.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i11.DriveService>(instanceName: 'google_drive'),
            ));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
