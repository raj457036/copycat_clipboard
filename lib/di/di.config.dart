// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart' as _i25;
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart' as _i33;
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart'
    as _i38;
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart' as _i42;
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart'
    as _i44;
import 'package:clipboard/bloc/collection_clips_cubit/collection_clips_cubit.dart'
    as _i39;
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart'
    as _i18;
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart'
    as _i41;
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i37;
import 'package:clipboard/bloc/search_cubit/search_cubit.dart' as _i45;
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart'
    as _i43;
import 'package:clipboard/bloc/window_action_cubit/window_action_cubit.dart'
    as _i5;
import 'package:clipboard/data/repositories/analytics.dart' as _i29;
import 'package:clipboard/data/repositories/app_config.dart' as _i24;
import 'package:clipboard/data/repositories/clip_collection.dart' as _i36;
import 'package:clipboard/data/repositories/clipboard.dart' as _i27;
import 'package:clipboard/data/repositories/subscription.dart' as _i31;
import 'package:clipboard/data/repositories/sync_clipboard.dart' as _i21;
import 'package:clipboard/data/services/clipboard_service.dart' as _i9;
import 'package:clipboard/data/services/google_drive_service.dart' as _i12;
import 'package:clipboard/data/sources/clip_collection/local_source.dart'
    as _i15;
import 'package:clipboard/data/sources/clipboard/local_source.dart' as _i17;
import 'package:clipboard/di/modules.dart' as _i11;
import 'package:copycat_base/data/services/google_services.dart' as _i13;
import 'package:copycat_base/db/clip_collection/clipcollection.dart' as _i40;
import 'package:copycat_base/domain/repositories/analytics.dart' as _i28;
import 'package:copycat_base/domain/repositories/app_config.dart' as _i23;
import 'package:copycat_base/domain/repositories/auth.dart' as _i34;
import 'package:copycat_base/domain/repositories/clip_collection.dart' as _i35;
import 'package:copycat_base/domain/repositories/clipboard.dart' as _i26;
import 'package:copycat_base/domain/repositories/drive_credential.dart' as _i19;
import 'package:copycat_base/domain/repositories/subscription.dart' as _i30;
import 'package:copycat_base/domain/repositories/sync_clipboard.dart' as _i20;
import 'package:copycat_base/domain/sources/clip_collection.dart' as _i14;
import 'package:copycat_base/domain/sources/clipboard.dart' as _i16;
import 'package:copycat_base/domain/sources/subscription.dart' as _i32;
import 'package:copycat_base/domain/sources/sync_clipboard.dart' as _i22;
import 'package:copycat_pro/di/di.module.dart' as _i3;
import 'package:firebase_analytics/firebase_analytics.dart' as _i7;
import 'package:focus_window/focus_window.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:tiny_storage/tiny_storage.dart' as _i8;

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
    await _i3.CopycatProPackageModule().init(gh);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i4.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    gh.factory<_i5.WindowActionCubit>(() => _i5.WindowActionCubit());
    gh.singleton<_i6.FocusWindow>(() => registerModule.focusWindow);
    gh.singleton<_i7.FirebaseAnalytics>(() => registerModule.analytics);
    await gh.singletonAsync<_i8.TinyStorage>(
      () => registerModule.localCache(),
      preResolve: true,
    );
    gh.singleton<_i9.ClipboardService>(() => _i9.ClipboardService());
    await gh.lazySingletonAsync<_i10.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i11.closeIsarDb,
    );
    gh.lazySingleton<_i12.GoogleOAuth2Service>(
        () => _i12.GoogleOAuth2Service());
    gh.lazySingleton<_i13.DriveService>(
      () => _i12.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i14.ClipCollectionSource>(
      () => _i15.LocalClipCollectionSource(gh<_i10.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i16.ClipboardSource>(
      () => _i17.LocalClipboardSource(gh<_i10.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i18.DriveSetupCubit>(
        () => _i18.DriveSetupCubit(gh<_i19.DriveCredentialRepository>()));
    gh.lazySingleton<_i20.SyncRepository>(() => _i21.SyncRepositoryImpl(
        gh<_i22.SyncClipboardSource>(instanceName: 'remote')));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i23.AppConfigRepository>(
        () => _i24.AppConfigRepositoryImpl(gh<_i10.Isar>()));
    gh.singleton<_i25.AppConfigCubit>(
        () => _i25.AppConfigCubit(gh<_i23.AppConfigRepository>()));
    gh.lazySingleton<_i26.ClipboardRepository>(
      () => _i27.ClipboardRepositoryOfflineImpl(
          gh<_i16.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.lazySingleton<_i28.AnalyticsRepository>(() =>
        _i29.AnalyticsRepositoryImpl(client: gh<_i7.FirebaseAnalytics>()));
    gh.lazySingleton<_i26.ClipboardRepository>(
      () => _i27.ClipboardRepositoryCloudImpl(
          gh<_i16.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.lazySingleton<_i30.SubscriptionRepository>(() =>
        _i31.SubscriptionRepositoryImpl(
            remote: gh<_i32.SubscriptionSource>(instanceName: 'remote')));
    gh.singleton<_i33.AuthCubit>(() => _i33.AuthCubit(
          gh<_i34.AuthRepository>(),
          gh<_i8.TinyStorage>(),
          gh<_i28.AnalyticsRepository>(),
        ));
    gh.lazySingleton<_i35.ClipCollectionRepository>(
        () => _i36.ClipCollectionRepositoryImpl(
              gh<_i14.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i14.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.lazySingleton<_i37.OfflinePersistanceCubit>(
        () => _i37.OfflinePersistanceCubit(
              gh<_i33.AuthCubit>(),
              gh<_i26.ClipboardRepository>(instanceName: 'offline'),
              gh<_i9.ClipboardService>(),
              gh<_i25.AppConfigCubit>(),
              gh<_i28.AnalyticsRepository>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.lazySingleton<_i38.ClipCollectionCubit>(() => _i38.ClipCollectionCubit(
          gh<_i33.AuthCubit>(),
          gh<_i35.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.factoryParam<_i39.CollectionClipsCubit, _i40.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i39.CollectionClipsCubit(
          gh<_i26.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.singleton<_i41.MonetizationCubit>(() => _i41.MonetizationCubit(
          repo: gh<_i30.SubscriptionRepository>(),
          analyticsRepo: gh<_i28.AnalyticsRepository>(),
        ));
    gh.factory<_i42.ClipboardCubit>(() => _i42.ClipboardCubit(
          gh<_i26.ClipboardRepository>(instanceName: 'offline'),
          gh<_i10.Isar>(),
        ));
    gh.singleton<_i43.SyncManagerCubit>(() => _i43.SyncManagerCubit(
          gh<_i10.Isar>(),
          gh<_i33.AuthCubit>(),
          gh<_i20.SyncRepository>(),
          gh<_i35.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i44.CloudPersistanceCubit>(
        () => _i44.CloudPersistanceCubit(
              gh<_i33.AuthCubit>(),
              gh<_i18.DriveSetupCubit>(),
              gh<_i25.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i26.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i13.DriveService>(instanceName: 'google_drive'),
            ));
    gh.factory<_i45.SearchCubit>(() => _i45.SearchCubit(
          gh<_i26.ClipboardRepository>(instanceName: 'offline'),
          gh<_i28.AnalyticsRepository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
