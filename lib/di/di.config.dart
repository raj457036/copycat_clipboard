// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:android_background_clipboard/android_background_clipboard.dart'
    as _i565;
import 'package:clipboard/base/bloc/android_bg_clipboard_cubit/android_bg_clipboard_cubit.dart'
    as _i643;
import 'package:clipboard/base/bloc/app_config_cubit/app_config_cubit.dart'
    as _i542;
import 'package:clipboard/base/bloc/app_lock_cubit/app_lock_cubit.dart'
    as _i242;
import 'package:clipboard/base/bloc/auth_cubit/auth_cubit.dart' as _i29;
import 'package:clipboard/base/bloc/clip_collection_cubit/clip_collection_cubit.dart'
    as _i620;
import 'package:clipboard/base/bloc/clipboard_cubit/clipboard_cubit.dart'
    as _i489;
import 'package:clipboard/base/bloc/collection_clips_cubit/collection_clips_cubit.dart'
    as _i46;
import 'package:clipboard/base/bloc/drive_setup_cubit/drive_setup_cubit.dart'
    as _i521;
import 'package:clipboard/base/bloc/event_bus_cubit/event_bus_cubit.dart'
    as _i588;
import 'package:clipboard/base/bloc/file_cloud_cubit/file_cloud_cubit.dart'
    as _i618;
import 'package:clipboard/base/bloc/monetization_cubit/monetization_cubit.dart'
    as _i246;
import 'package:clipboard/base/bloc/offline_persistance_cubit/offline_persistance_cubit.dart'
    as _i706;
import 'package:clipboard/base/bloc/paste_stack_cubit/paste_stack_cubit.dart'
    as _i554;
import 'package:clipboard/base/bloc/review_prompt_cubit/review_prompt_cubit.dart'
    as _i235;
import 'package:clipboard/base/bloc/selected_clips_cubit/selected_clips_cubit.dart'
    as _i653;
import 'package:clipboard/base/bloc/sync_status_cubit/sync_status_cubit.dart'
    as _i892;
import 'package:clipboard/base/bloc/user_devices_cubit/user_devices_cubit.dart'
    as _i805;
import 'package:clipboard/base/bloc/webdav_setup_cubit/webdav_setup_cubit.dart'
    as _i923;
import 'package:clipboard/base/bloc/window_action_cubit/window_action_cubit.dart'
    as _i657;
import 'package:clipboard/base/data/adapters/clip_sync_adapter.dart' as _i8;
import 'package:clipboard/base/data/adapters/collection_clip_sync_adapter.dart'
    as _i272;
import 'package:clipboard/base/data/adapters/collection_sync_adapter.dart'
    as _i220;
import 'package:clipboard/base/data/isar/repositories/isar_sync_cursor_repository.dart'
    as _i958;
import 'package:clipboard/base/data/isar/repositories/isar_sync_outbox_repository.dart'
    as _i442;
import 'package:clipboard/base/data/isar/services/isar_clip_batch_sync_service.dart'
    as _i639;
import 'package:clipboard/base/data/repositories/app_config.dart' as _i656;
import 'package:clipboard/base/data/repositories/app_directory.dart' as _i715;
import 'package:clipboard/base/data/repositories/application_meta.dart'
    as _i756;
import 'package:clipboard/base/data/repositories/auth.dart' as _i346;
import 'package:clipboard/base/data/repositories/clip_collection.dart' as _i432;
import 'package:clipboard/base/data/repositories/clipboard.dart' as _i378;
import 'package:clipboard/base/data/repositories/drive_credential.dart'
    as _i477;
import 'package:clipboard/base/data/repositories/restoration_status.dart'
    as _i970;
import 'package:clipboard/base/data/repositories/subscription.dart' as _i623;
import 'package:clipboard/base/data/repositories/sync_clipboard.dart' as _i223;
import 'package:clipboard/base/data/repositories/user_devices.dart' as _i843;
import 'package:clipboard/base/data/repositories/webdav_credential.dart'
    as _i215;
import 'package:clipboard/base/data/services/application_meta_resolver.dart'
    as _i375;
import 'package:clipboard/base/data/services/clipboard_service.dart' as _i63;
import 'package:clipboard/base/data/services/cross_sync_listener.dart' as _i95;
import 'package:clipboard/base/data/services/file_cloud_services/composite_file_cloud_service.dart'
    as _i919;
import 'package:clipboard/base/data/services/file_cloud_services/google_drive/google_drive_file_cloud_service.dart'
    as _i858;
import 'package:clipboard/base/data/services/file_cloud_services/google_drive/google_drive_service.dart'
    as _i563;
import 'package:clipboard/base/data/services/file_cloud_services/google_drive/google_services.dart'
    as _i543;
import 'package:clipboard/base/data/services/file_cloud_services/webdav/webdav_cleanup_service.dart'
    as _i179;
import 'package:clipboard/base/data/services/file_cloud_services/webdav/webdav_file_cloud_service.dart'
    as _i1008;
import 'package:clipboard/base/data/services/in_app_review_service.dart'
    as _i930;
import 'package:clipboard/base/data/services/lan_sync/lan_sync_service.dart'
    as _i976;
import 'package:clipboard/base/data/services/local_auth_service.dart' as _i405;
import 'package:clipboard/base/data/services/post_sync_decryption_service.dart'
    as _i579;
import 'package:clipboard/base/data/services/quick_paste_service.dart' as _i227;
import 'package:clipboard/base/data/sources/application_meta/local_source.dart'
    as _i651;
import 'package:clipboard/base/data/sources/clip_collection/local_source.dart'
    as _i173;
import 'package:clipboard/base/data/sources/clip_collection/remote_source.dart'
    as _i899;
import 'package:clipboard/base/data/sources/clipboard/local_source.dart'
    as _i730;
import 'package:clipboard/base/data/sources/clipboard/remote_source.dart'
    as _i411;
import 'package:clipboard/base/data/sources/restoration_status/local_source.dart'
    as _i364;
import 'package:clipboard/base/data/sources/subscription/remote_source.dart'
    as _i35;
import 'package:clipboard/base/data/sources/sync_clipboard/remote_source.dart'
    as _i425;
import 'package:clipboard/base/data/sources/user_devices/remote_source.dart'
    as _i752;
import 'package:clipboard/base/domain/model/clip_collection/clipcollection.dart'
    as _i687;
import 'package:clipboard/base/domain/model/clipboard_item/clipboard_item.dart'
    as _i1066;
import 'package:clipboard/base/domain/repositories/app_config.dart' as _i891;
import 'package:clipboard/base/domain/repositories/app_directory.dart' as _i636;
import 'package:clipboard/base/domain/repositories/application_meta.dart'
    as _i110;
import 'package:clipboard/base/domain/repositories/auth.dart' as _i580;
import 'package:clipboard/base/domain/repositories/clip_collection.dart'
    as _i276;
import 'package:clipboard/base/domain/repositories/clipboard.dart' as _i230;
import 'package:clipboard/base/domain/repositories/drive_credential.dart'
    as _i460;
import 'package:clipboard/base/domain/repositories/restoration_status.dart'
    as _i1069;
import 'package:clipboard/base/domain/repositories/subscription.dart' as _i956;
import 'package:clipboard/base/domain/repositories/sync_clipboard.dart' as _i61;
import 'package:clipboard/base/domain/repositories/sync_cursor.dart' as _i834;
import 'package:clipboard/base/domain/repositories/sync_outbox.dart' as _i770;
import 'package:clipboard/base/domain/repositories/user_devices.dart' as _i462;
import 'package:clipboard/base/domain/repositories/webdav_credential.dart'
    as _i193;
import 'package:clipboard/base/domain/services/application_meta_resolver.dart'
    as _i533;
import 'package:clipboard/base/domain/services/clip_batch_sync_service.dart'
    as _i616;
import 'package:clipboard/base/domain/services/cross_sync_listener.dart'
    as _i545;
import 'package:clipboard/base/domain/services/database_service.dart' as _i671;
import 'package:clipboard/base/domain/services/file_cloud_service.dart'
    as _i112;
import 'package:clipboard/base/domain/services/in_app_review_service.dart'
    as _i952;
import 'package:clipboard/base/domain/services/sync_adapter.dart' as _i589;
import 'package:clipboard/base/domain/services/sync_event_bus.dart' as _i292;
import 'package:clipboard/base/domain/sources/application_meta.dart' as _i284;
import 'package:clipboard/base/domain/sources/clip_collection.dart' as _i670;
import 'package:clipboard/base/domain/sources/clipboard.dart' as _i23;
import 'package:clipboard/base/domain/sources/restoration_status.dart' as _i922;
import 'package:clipboard/base/domain/sources/subscription.dart' as _i422;
import 'package:clipboard/base/domain/sources/sync_clipboard.dart' as _i782;
import 'package:clipboard/base/domain/sources/user_devices.dart' as _i544;
import 'package:clipboard/base/sync/sync_orchestrator.dart' as _i443;
import 'package:clipboard/di/modules.dart' as _i234;
import 'package:focus_window/focus_window.dart' as _i291;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:isar_community/isar.dart' as _i214;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:tiny_storage/tiny_storage.dart' as _i829;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i653.SelectedClipsCubit>(() => _i653.SelectedClipsCubit());
    gh.factory<_i657.WindowActionCubit>(() => _i657.WindowActionCubit());
    await gh.factoryAsync<_i655.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    gh.singleton<_i588.EventBusCubit>(() => _i588.EventBusCubit());
    gh.singleton<_i63.ClipboardService>(() => _i63.ClipboardService());
    gh.singleton<_i292.SyncEventBus>(() => _i292.SyncEventBus());
    gh.singleton<_i291.FocusWindow>(() => registerModule.focusWindow);
    await gh.singletonAsync<_i829.TinyStorage>(
      () => registerModule.localCache(),
      preResolve: true,
    );
    gh.lazySingleton<_i563.GoogleOAuth2Service>(
      () => _i563.GoogleOAuth2Service(),
    );
    gh.lazySingleton<_i405.LocalAuthService>(() => _i405.LocalAuthService());
    await gh.lazySingletonAsync<_i214.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i234.closeIsarDb,
    );
    gh.lazySingleton<_i565.AndroidBackgroundClipboard>(
      () => registerModule.bgService,
    );
    gh.lazySingleton<_i891.AppConfigRepository>(
      () => _i656.AppConfigRepositoryImpl(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i616.ClipBatchSyncService>(
      () => _i639.IsarClipBatchSyncService(),
    );
    gh.lazySingleton<_i952.InAppReviewService>(
      () => _i930.InAppReviewServiceImpl(),
    );
    gh.lazySingleton<_i671.DatabaseService>(
      () => registerModule.databaseService(gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i284.ApplicationMetaSource>(
      () => _i651.LocalApplicationMetaSource(gh<_i214.Isar>()),
      instanceName: 'local',
    );
    gh.factory<String>(
      () => registerModule.supabaseProjectKey,
      instanceName: 'supabase_project_key',
    );
    gh.lazySingleton<_i543.DriveService>(
      () => _i563.GoogleDriveService(),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i770.SyncOutboxRepository>(
      () => _i442.IsarSyncOutboxRepository(),
    );
    gh.factory<String>(
      () => registerModule.supabaseUrl,
      instanceName: 'supabase_url',
    );
    await gh.factoryAsync<String>(
      () => registerModule.deviceId(gh<_i829.TinyStorage>()),
      instanceName: 'device_id',
      preResolve: true,
    );
    gh.lazySingleton<_i834.SyncCursorRepository>(
      () => _i958.IsarSyncCursorRepository(),
    );
    gh.factory<String>(
      () => registerModule.supabaseKey,
      instanceName: 'supabase_key',
    );
    gh.lazySingleton<_i922.RestorationStatusSource>(
      () => _i364.RestorationStatusSourceImpl(db: gh<_i214.Isar>()),
    );
    gh.lazySingleton<_i235.ReviewPromptCubit>(
      () => _i235.ReviewPromptCubit(
        gh<_i829.TinyStorage>(),
        gh<_i952.InAppReviewService>(),
      ),
    );
    await gh.singletonAsync<_i454.SupabaseClient>(
      () => registerModule.client(
        gh<String>(instanceName: 'supabase_url'),
        gh<String>(instanceName: 'supabase_key'),
      ),
      preResolve: true,
    );
    gh.lazySingleton<_i976.LanSyncService>(
      () => _i976.LanSyncService(
        gh<_i616.ClipBatchSyncService>(),
        gh<_i292.SyncEventBus>(),
        gh<_i770.SyncOutboxRepository>(),
      ),
    );
    gh.lazySingleton<_i782.SyncClipboardSource>(
      () => _i425.SyncClipboardSourceImpl(gh<_i454.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i23.ClipboardSource>(
      () => _i411.RemoteClipboardSource(gh<_i454.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i544.UserDevicesSource>(
      () => _i752.RemoteUserDevicesSource(gh<_i454.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i422.SubscriptionSource>(
      () => _i35.RemoteSubscriptionSource(client: gh<_i454.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i670.ClipCollectionSource>(
      () => _i173.LocalClipCollectionSource(
        gh<_i214.Isar>(),
        gh<String>(instanceName: 'device_id'),
      ),
      instanceName: 'local',
    );
    gh.singleton<_i542.AppConfigCubit>(
      () => _i542.AppConfigCubit(gh<_i891.AppConfigRepository>()),
    );
    gh.lazySingleton<_i460.DriveCredentialRepository>(
      () => _i477.DriveCredentialRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i61.SyncRepository>(
      () => _i223.SyncRepositoryImpl(
        gh<_i782.SyncClipboardSource>(instanceName: 'remote'),
      ),
    );
    gh.lazySingleton<_i545.ClipCrossSyncListener>(
      () => _i95.SBClipCrossSyncListener(
        gh<_i454.SupabaseClient>(),
        gh<String>(instanceName: 'device_id'),
      ),
    );
    gh.lazySingleton<_i193.WebDavCredentialRepository>(
      () => _i215.WebDavCredentialRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i110.ApplicationMetaRepository>(
      () => _i756.ApplicationMetaRepositoryImpl(
        gh<_i284.ApplicationMetaSource>(instanceName: 'local'),
      ),
    );
    gh.lazySingleton<_i23.ClipboardSource>(
      () => _i730.LocalClipboardSource(
        gh<_i214.Isar>(),
        gh<String>(instanceName: 'device_id'),
        gh<_i770.SyncOutboxRepository>(),
      ),
      instanceName: 'local',
    );
    gh.lazySingleton<_i242.AppLockCubit>(
      () => _i242.AppLockCubit(
        gh<_i542.AppConfigCubit>(),
        gh<_i405.LocalAuthService>(),
      ),
    );
    gh.lazySingleton<_i545.CollectionCrossSyncListener>(
      () => _i95.SBCollectionCrossSyncListener(
        gh<_i454.SupabaseClient>(),
        gh<String>(instanceName: 'device_id'),
      ),
    );
    gh.lazySingleton<_i1069.RestorationStatusRepository>(
      () => _i970.RestorationStatusRepositoryImpl(
        gh<_i922.RestorationStatusSource>(),
      ),
    );
    gh.lazySingleton<_i636.AppDirectoryRepository>(
      () => _i715.AppDirectoryRepositoryImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i462.UserDevicesRepository>(
      () => _i843.UserDevicesRepositoryImpl(
        gh<_i544.UserDevicesSource>(instanceName: 'remote'),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.factoryCached<_i923.WebDavSetupCubit>(
      () => _i923.WebDavSetupCubit(gh<_i193.WebDavCredentialRepository>()),
    );
    gh.factoryCached<_i521.DriveSetupCubit>(
      () => _i521.DriveSetupCubit(
        gh<_i460.DriveCredentialRepository>(),
        gh<_i543.DriveService>(instanceName: 'google_drive'),
      ),
    );
    gh.lazySingleton<_i579.PostSyncDecryptionService>(
      () => _i579.PostSyncDecryptionService(
        gh<_i23.ClipboardSource>(instanceName: 'local'),
      ),
    );
    gh.lazySingleton<_i580.AuthRepository>(
      () => _i346.AuthRepositoryImpl(client: gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i670.ClipCollectionSource>(
      () => _i899.RemoteClipCollectionSource(gh<_i454.SupabaseClient>()),
      instanceName: 'remote',
    );
    gh.singleton<_i29.AuthCubit>(
      () => _i29.AuthCubit(
        gh<_i580.AuthRepository>(),
        gh<_i829.TinyStorage>(),
        gh<_i542.AppConfigCubit>(),
      ),
    );
    gh.lazySingleton<_i112.FileCloudService>(
      () => _i858.GoogleDriveFileCloudService(
        gh<_i543.DriveService>(instanceName: 'google_drive'),
        gh<_i542.AppConfigCubit>(),
      ),
      instanceName: 'google_drive',
    );
    gh.lazySingleton<_i276.ClipCollectionRepository>(
      () => _i432.ClipCollectionRepositoryImpl(
        gh<_i670.ClipCollectionSource>(instanceName: 'remote'),
        gh<_i670.ClipCollectionSource>(instanceName: 'local'),
        gh<_i770.SyncOutboxRepository>(),
      ),
    );
    gh.lazySingleton<_i230.ClipboardRepository>(
      () => _i378.ClipboardRepositoryOfflineImpl(
        gh<_i23.ClipboardSource>(instanceName: 'local'),
        gh<_i770.SyncOutboxRepository>(),
      ),
      instanceName: 'local',
    );
    gh.lazySingleton<_i956.SubscriptionRepository>(
      () => _i623.SubscriptionRepositoryImpl(
        remote: gh<_i422.SubscriptionSource>(instanceName: 'remote'),
      ),
    );
    gh.lazySingleton<_i230.ClipboardRepository>(
      () => _i378.ClipboardRepositoryCloudImpl(
        gh<_i23.ClipboardSource>(instanceName: 'remote'),
      ),
      instanceName: 'remote',
    );
    gh.lazySingleton<_i533.ApplicationMetaResolver>(
      () => _i375.ApplicationMetaResolverImpl(
        gh<_i110.ApplicationMetaRepository>(),
        gh<_i291.FocusWindow>(),
        gh<_i636.AppDirectoryRepository>(),
      ),
    );
    gh.lazySingleton<_i112.FileCloudService>(
      () => _i1008.WebDavFileCloudService(
        gh<_i193.WebDavCredentialRepository>(),
        gh<_i542.AppConfigCubit>(),
      ),
      instanceName: 'webdav',
    );
    gh.lazySingleton<_i643.AndroidBgClipboardCubit>(
      () => _i643.AndroidBgClipboardCubit(
        gh<_i565.AndroidBackgroundClipboard>(),
        gh<_i292.SyncEventBus>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<String>(instanceName: 'device_id'),
      ),
    );
    gh.factoryParam<_i46.CollectionClipsCubit, _i687.ClipCollection, dynamic>(
      (collection, _) => _i46.CollectionClipsCubit(
        gh<_i292.SyncEventBus>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        collection: collection,
      ),
    );
    gh.lazySingleton<_i179.WebDavCleanupService>(
      () => _i179.WebDavCleanupService(
        gh<_i193.WebDavCredentialRepository>(),
        gh<_i112.FileCloudService>(instanceName: 'webdav'),
        gh<_i23.ClipboardSource>(instanceName: 'local'),
      ),
    );
    gh.singleton<_i246.MonetizationCubit>(
      () => _i246.MonetizationCubit(repo: gh<_i956.SubscriptionRepository>()),
    );
    gh.factoryCached<_i620.ClipCollectionCubit>(
      () => _i620.ClipCollectionCubit(
        gh<_i292.SyncEventBus>(),
        gh<_i29.AuthCubit>(),
        gh<_i276.ClipCollectionRepository>(),
        gh<String>(instanceName: 'device_id'),
        gh<_i246.MonetizationCubit>(),
      ),
    );
    gh.lazySingleton<_i112.FileCloudService>(
      () => _i919.CompositeFileCloudService(
        gh<_i112.FileCloudService>(instanceName: 'google_drive'),
        gh<_i112.FileCloudService>(instanceName: 'webdav'),
        gh<_i542.AppConfigCubit>(),
      ),
    );
    gh.lazySingleton<_i589.SyncAdapter<_i1066.ClipboardItem>>(
      () => _i272.CollectionClipSyncAdapter(
        gh<_i61.SyncRepository>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<_i230.ClipboardRepository>(instanceName: 'remote'),
        gh<_i616.ClipBatchSyncService>(),
        gh<_i112.FileCloudService>(),
        gh<_i23.ClipboardSource>(instanceName: 'local'),
      ),
      instanceName: 'collection_clips',
    );
    gh.factory<_i618.FileCloudCubit>(
      () => _i618.FileCloudCubit(
        gh<_i112.FileCloudService>(),
        gh<_i23.ClipboardSource>(instanceName: 'local'),
        gh<_i292.SyncEventBus>(),
      ),
    );
    gh.lazySingleton<_i589.SyncAdapter<_i687.ClipCollection>>(
      () => _i220.CollectionSyncAdapter(
        gh<_i61.SyncRepository>(),
        gh<_i276.ClipCollectionRepository>(),
        gh<_i670.ClipCollectionSource>(instanceName: 'local'),
        gh<_i670.ClipCollectionSource>(instanceName: 'remote'),
        gh<_i620.ClipCollectionCubit>(),
        gh<_i545.CollectionCrossSyncListener>(),
      ),
    );
    gh.lazySingleton<_i589.SyncAdapter<_i1066.ClipboardItem>>(
      () => _i8.ClipSyncAdapter(
        gh<_i61.SyncRepository>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<_i230.ClipboardRepository>(instanceName: 'remote'),
        gh<_i616.ClipBatchSyncService>(),
        gh<_i545.ClipCrossSyncListener>(),
        gh<_i112.FileCloudService>(),
        gh<_i23.ClipboardSource>(instanceName: 'local'),
        gh<String>(instanceName: 'device_id'),
      ),
      instanceName: 'non_collection_clips',
    );
    gh.singleton<_i443.SyncOrchestrator>(
      () => _i443.SyncOrchestrator(
        gh<_i589.SyncAdapter<_i1066.ClipboardItem>>(
          instanceName: 'non_collection_clips',
        ),
        gh<_i589.SyncAdapter<_i1066.ClipboardItem>>(
          instanceName: 'collection_clips',
        ),
        gh<_i589.SyncAdapter<_i687.ClipCollection>>(),
        gh<_i834.SyncCursorRepository>(),
        gh<_i770.SyncOutboxRepository>(),
        gh<_i292.SyncEventBus>(),
        gh<String>(instanceName: 'device_id'),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i892.SyncStatusCubit>(
      () => _i892.SyncStatusCubit(
        gh<_i443.SyncOrchestrator>(),
        gh<_i292.SyncEventBus>(),
        gh<_i246.MonetizationCubit>(),
        gh<_i579.PostSyncDecryptionService>(),
        gh<_i1069.RestorationStatusRepository>(),
      ),
    );
    gh.singleton<_i805.UserDevicesCubit>(
      () => _i805.UserDevicesCubit(
        repo: gh<_i462.UserDevicesRepository>(),
        packageInfo: gh<_i655.PackageInfo>(),
        deviceId: gh<String>(instanceName: 'device_id'),
        syncOrchestrator: gh<_i443.SyncOrchestrator>(),
        appConfigCubit: gh<_i542.AppConfigCubit>(),
        monetizationCubit: gh<_i246.MonetizationCubit>(),
      ),
    );
    gh.lazySingleton<_i706.OfflinePersistenceCubit>(
      () => _i706.OfflinePersistenceCubit(
        gh<_i29.AuthCubit>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<_i63.ClipboardService>(),
        gh<_i542.AppConfigCubit>(),
        gh<_i805.UserDevicesCubit>(),
        gh<_i533.ApplicationMetaResolver>(),
        gh<String>(instanceName: 'device_id'),
        gh<_i292.SyncEventBus>(),
      ),
    );
    gh.factoryCached<_i489.ClipboardCubit>(
      () => _i489.ClipboardCubit(
        gh<_i292.SyncEventBus>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<_i542.AppConfigCubit>(),
        gh<_i892.SyncStatusCubit>(),
      ),
    );
    gh.lazySingleton<_i227.QuickPasteService>(
      () => _i227.QuickPasteService(
        gh<_i542.AppConfigCubit>(),
        gh<_i230.ClipboardRepository>(instanceName: 'local'),
        gh<_i706.OfflinePersistenceCubit>(),
        gh<_i533.ApplicationMetaResolver>(),
        gh<_i291.FocusWindow>(),
      ),
    );
    gh.factoryCached<_i554.PasteStackCubit>(
      () => _i554.PasteStackCubit(
        gh<_i542.AppConfigCubit>(),
        gh<_i657.WindowActionCubit>(),
        gh<_i246.MonetizationCubit>(),
        gh<_i706.OfflinePersistenceCubit>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i234.RegisterModule {}
