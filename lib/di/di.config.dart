// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:focus_window/focus_window.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i7;
import 'package:package_info_plus/package_info_plus.dart' as _i3;
import 'package:supabase_auth_ui/supabase_auth_ui.dart' as _i27;
import 'package:supabase_flutter/supabase_flutter.dart' as _i16;

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i15;
import '../bloc/auth_cubit/auth_cubit.dart' as _i22;
import '../bloc/clip_collection_cubit/clip_collection_cubit.dart' as _i37;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i25;
import '../bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart' as _i36;
import '../bloc/collection_clips_cubit/collection_clips_cubit.dart' as _i31;
import '../bloc/drive_setup_cubit/drive_setup_cubit.dart' as _i29;
import '../bloc/monetization_cubit/monetization_cubit.dart' as _i34;
import '../bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i24;
import '../bloc/search_cubit/search_cubit.dart' as _i28;
import '../bloc/sync_manager_cubit/sync_manager_cubit.dart' as _i35;
import '../bloc/window_action_cubit/window_action_cubit.dart' as _i4;
import '../data/repositories/app_config.dart' as _i10;
import '../data/repositories/clip_collection.dart' as _i30;
import '../data/repositories/clipboard.dart' as _i17;
import '../data/repositories/drive_credential.dart' as _i26;
import '../data/repositories/subscription.dart' as _i33;
import '../data/repositories/sync_clipboard.dart' as _i18;
import '../data/services/clipboard_service.dart' as _i6;
import '../data/services/google_services.dart' as _i9;
import '../data/sources/clip_collection/clip_collection.dart' as _i13;
import '../data/sources/clip_collection/local_source.dart' as _i14;
import '../data/sources/clip_collection/remote_source.dart' as _i23;
import '../data/sources/clipboard/clipboard.dart' as _i11;
import '../data/sources/clipboard/local_source.dart' as _i12;
import '../data/sources/clipboard/remote_source.dart' as _i19;
import '../data/sources/subscription/remote_source.dart' as _i21;
import '../data/sources/subscription/subscription.dart' as _i20;
import '../db/clip_collection/clipcollection.dart' as _i32;
import 'modules.dart' as _i8;

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
    gh.singleton<_i6.ClipboardService>(() => _i6.ClipboardService());
    await gh.lazySingletonAsync<_i7.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i8.closeIsarDb,
    );
    gh.lazySingleton<_i9.GoogleOAuth2Service>(() => _i9.GoogleOAuth2Service());
    gh.lazySingleton<_i10.AppConfigRepository>(
        () => _i10.AppConfigRepositoryImpl(gh<_i7.Isar>()));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i11.ClipboardSource>(
      () => _i12.LocalClipboardSource(gh<_i7.Isar>()),
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
    gh.lazySingleton<_i13.ClipCollectionSource>(
      () => _i14.LocalClipCollectionSource(gh<_i7.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i9.DriveService>(
      () => _i9.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.singleton<_i15.AppConfigCubit>(
        () => _i15.AppConfigCubit(gh<_i10.AppConfigRepository>()));
    await gh.singletonAsync<_i16.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i17.ClipboardRepository>(
      () => _i17.ClipboardRepositoryOfflineImpl(
          gh<_i11.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i18.SyncRepository>(
        () => _i18.SyncRepositoryImpl(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i11.ClipboardSource>(
      () => _i19.RemoteClipboardSource(gh<_i16.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i20.SubscriptionSource>(
      () => _i21.RemoteSubscriptionSource(client: gh<_i16.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i22.AuthCubit>(
        () => _i22.AuthCubit(gh<_i16.SupabaseClient>()));
    gh.lazySingleton<_i13.ClipCollectionSource>(
      () => _i23.RemoteClipCollectionSource(gh<_i16.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i24.OfflinePersistanceCubit>(
        () => _i24.OfflinePersistanceCubit(
              gh<_i22.AuthCubit>(),
              gh<_i17.ClipboardRepository>(instanceName: 'offline'),
              gh<_i6.ClipboardService>(),
              gh<_i15.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.factory<_i25.ClipboardCubit>(() => _i25.ClipboardCubit(
          gh<_i17.ClipboardRepository>(instanceName: 'offline'),
          gh<_i7.Isar>(),
        ));
    gh.lazySingleton<_i26.DriveCredentialRepository>(
        () => _i26.DriveCredentialRepositoryImpl(gh<_i27.SupabaseClient>()));
    gh.lazySingleton<_i17.ClipboardRepository>(
      () => _i17.ClipboardRepositoryCloudImpl(
          gh<_i11.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.factory<_i28.SearchCubit>(() => _i28.SearchCubit(
        gh<_i17.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i29.DriveSetupCubit>(
        () => _i29.DriveSetupCubit(gh<_i26.DriveCredentialRepository>()));
    gh.lazySingleton<_i30.ClipCollectionRepository>(
        () => _i30.ClipCollectionRepositoryImpl(
              gh<_i13.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i13.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.factoryParam<_i31.CollectionClipsCubit, _i32.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i31.CollectionClipsCubit(
          gh<_i17.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.lazySingleton<_i33.SubscriptionRepository>(
        () => _i33.SubscriptionRepositoryImpl(
              client: gh<_i16.SupabaseClient>(),
              remote: gh<_i20.SubscriptionSource>(instanceName: 'remote'),
            ));
    gh.singleton<_i34.MonetizationCubit>(
        () => _i34.MonetizationCubit(gh<_i33.SubscriptionRepository>()));
    gh.singleton<_i35.SyncManagerCubit>(() => _i35.SyncManagerCubit(
          gh<_i7.Isar>(),
          gh<_i22.AuthCubit>(),
          gh<_i18.SyncRepository>(),
          gh<_i30.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i36.CloudPersistanceCubit>(
        () => _i36.CloudPersistanceCubit(
              gh<_i22.AuthCubit>(),
              gh<_i29.DriveSetupCubit>(),
              gh<_i15.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i17.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i9.DriveService>(instanceName: 'google_drive'),
            ));
    gh.lazySingleton<_i37.ClipCollectionCubit>(() => _i37.ClipCollectionCubit(
          gh<_i22.AuthCubit>(),
          gh<_i30.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
