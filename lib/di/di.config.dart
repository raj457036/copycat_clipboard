// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clipboard/bloc/app_config_cubit/app_config_cubit.dart' as _i26;
import 'package:clipboard/bloc/auth_cubit/auth_cubit.dart' as _i19;
import 'package:clipboard/bloc/clip_collection_cubit/clip_collection_cubit.dart'
    as _i35;
import 'package:clipboard/bloc/clipboard_cubit/clipboard_cubit.dart' as _i38;
import 'package:clipboard/bloc/cloud_persistance_cubit/cloud_persistance_cubit.dart'
    as _i42;
import 'package:clipboard/bloc/collection_clips_cubit/collection_clips_cubit.dart'
    as _i36;
import 'package:clipboard/bloc/drive_setup_cubit/drive_setup_cubit.dart'
    as _i17;
import 'package:clipboard/bloc/monetization_cubit/monetization_cubit.dart'
    as _i40;
import 'package:clipboard/bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i39;
import 'package:clipboard/bloc/search_cubit/search_cubit.dart' as _i29;
import 'package:clipboard/bloc/sync_manager_cubit/sync_manager_cubit.dart'
    as _i41;
import 'package:clipboard/bloc/window_action_cubit/window_action_cubit.dart'
    as _i5;
import 'package:clipboard/data/repositories/app_config.dart' as _i25;
import 'package:clipboard/data/repositories/clip_collection.dart' as _i34;
import 'package:clipboard/data/repositories/clipboard.dart' as _i28;
import 'package:clipboard/data/repositories/subscription.dart' as _i31;
import 'package:clipboard/data/repositories/sync_clipboard.dart' as _i22;
import 'package:clipboard/data/services/clipboard_service.dart' as _i8;
import 'package:clipboard/data/services/google_drive_service.dart' as _i11;
import 'package:clipboard/data/sources/clip_collection/local_source.dart'
    as _i14;
import 'package:clipboard/data/sources/clipboard/local_source.dart' as _i16;
import 'package:clipboard/di/modules.dart' as _i10;
import 'package:copycat_base/data/services/google_services.dart' as _i12;
import 'package:copycat_base/db/clip_collection/clipcollection.dart' as _i37;
import 'package:copycat_base/domain/repositories/app_config.dart' as _i24;
import 'package:copycat_base/domain/repositories/auth.dart' as _i20;
import 'package:copycat_base/domain/repositories/clip_collection.dart' as _i33;
import 'package:copycat_base/domain/repositories/clipboard.dart' as _i27;
import 'package:copycat_base/domain/repositories/drive_credential.dart' as _i18;
import 'package:copycat_base/domain/repositories/subscription.dart' as _i30;
import 'package:copycat_base/domain/repositories/sync_clipboard.dart' as _i21;
import 'package:copycat_base/domain/sources/clip_collection.dart' as _i13;
import 'package:copycat_base/domain/sources/clipboard.dart' as _i15;
import 'package:copycat_base/domain/sources/subscription.dart' as _i32;
import 'package:copycat_base/domain/sources/sync_clipboard.dart' as _i23;
import 'package:copycat_pro/di/di.module.dart' as _i3;
import 'package:focus_window/focus_window.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i9;
import 'package:package_info_plus/package_info_plus.dart' as _i4;
import 'package:tiny_storage/tiny_storage.dart' as _i7;

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
    await gh.singletonAsync<_i7.TinyStorage>(
      () => registerModule.localCache(),
      preResolve: true,
    );
    gh.singleton<_i8.ClipboardService>(() => _i8.ClipboardService());
    await gh.lazySingletonAsync<_i9.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i10.closeIsarDb,
    );
    gh.lazySingleton<_i11.GoogleOAuth2Service>(
        () => _i11.GoogleOAuth2Service());
    gh.lazySingleton<_i12.DriveService>(
      () => _i11.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i13.ClipCollectionSource>(
      () => _i14.LocalClipCollectionSource(gh<_i9.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i15.ClipboardSource>(
      () => _i16.LocalClipboardSource(gh<_i9.Isar>()),
      instanceName: 'local',
    );
    gh.lazySingleton<_i17.DriveSetupCubit>(
        () => _i17.DriveSetupCubit(gh<_i18.DriveCredentialRepository>()));
    gh.singleton<_i19.AuthCubit>(() => _i19.AuthCubit(
          gh<_i20.AuthRepository>(),
          gh<_i7.TinyStorage>(),
        ));
    gh.lazySingleton<_i21.SyncRepository>(() => _i22.SyncRepositoryImpl(
        gh<_i23.SyncClipboardSource>(instanceName: 'remote')));
    await gh.factoryAsync<String>(
      () => registerModule.deviceId,
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i24.AppConfigRepository>(
        () => _i25.AppConfigRepositoryImpl(gh<_i9.Isar>()));
    gh.singleton<_i26.AppConfigCubit>(
        () => _i26.AppConfigCubit(gh<_i24.AppConfigRepository>()));
    gh.lazySingleton<_i27.ClipboardRepository>(
      () => _i28.ClipboardRepositoryOfflineImpl(
          gh<_i15.ClipboardSource>(instanceName: 'local')),
      instanceName: 'offline',
    );
    gh.factory<_i29.SearchCubit>(() => _i29.SearchCubit(
        gh<_i27.ClipboardRepository>(instanceName: 'offline')));
    gh.lazySingleton<_i27.ClipboardRepository>(
      () => _i28.ClipboardRepositoryCloudImpl(
          gh<_i15.ClipboardSource>(instanceName: 'remote')),
      instanceName: 'cloud',
    );
    gh.lazySingleton<_i30.SubscriptionRepository>(() =>
        _i31.SubscriptionRepositoryImpl(
            remote: gh<_i32.SubscriptionSource>(instanceName: 'remote')));
    gh.lazySingleton<_i33.ClipCollectionRepository>(
        () => _i34.ClipCollectionRepositoryImpl(
              gh<_i13.ClipCollectionSource>(instanceName: 'remote'),
              gh<_i13.ClipCollectionSource>(instanceName: 'local'),
            ));
    gh.lazySingleton<_i35.ClipCollectionCubit>(() => _i35.ClipCollectionCubit(
          gh<_i19.AuthCubit>(),
          gh<_i33.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.factoryParam<_i36.CollectionClipsCubit, _i37.ClipCollection, dynamic>((
      collection,
      _,
    ) =>
        _i36.CollectionClipsCubit(
          gh<_i27.ClipboardRepository>(instanceName: 'offline'),
          collection: collection,
        ));
    gh.factory<_i38.ClipboardCubit>(() => _i38.ClipboardCubit(
          gh<_i27.ClipboardRepository>(instanceName: 'offline'),
          gh<_i9.Isar>(),
        ));
    gh.lazySingleton<_i39.OfflinePersistanceCubit>(
        () => _i39.OfflinePersistanceCubit(
              gh<_i19.AuthCubit>(),
              gh<_i27.ClipboardRepository>(instanceName: 'offline'),
              gh<_i8.ClipboardService>(),
              gh<_i26.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
            ));
    gh.singleton<_i40.MonetizationCubit>(() => _i40.MonetizationCubit(
          cubit: gh<_i19.AuthCubit>(),
          repo: gh<_i30.SubscriptionRepository>(),
        ));
    gh.singleton<_i41.SyncManagerCubit>(() => _i41.SyncManagerCubit(
          gh<_i9.Isar>(),
          gh<_i19.AuthCubit>(),
          gh<_i21.SyncRepository>(),
          gh<_i33.ClipCollectionRepository>(),
          gh<String>(instanceName: 'device_id'),
        ));
    gh.lazySingleton<_i42.CloudPersistanceCubit>(
        () => _i42.CloudPersistanceCubit(
              gh<_i19.AuthCubit>(),
              gh<_i17.DriveSetupCubit>(),
              gh<_i26.AppConfigCubit>(),
              gh<String>(instanceName: 'device_id'),
              gh<_i27.ClipboardRepository>(instanceName: 'cloud'),
              gh<_i12.DriveService>(instanceName: 'google_drive'),
            ));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
