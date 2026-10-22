import "package:android_background_clipboard/android_background_clipboard.dart";
import "package:clipboard/base/constants/strings/strings.dart";
import "package:clipboard/base/data/isar/isar_database.dart";
import "package:clipboard/base/data/isar/isar_database_service.dart";
import "package:clipboard/base/data/services/supabase_http_client.dart";
import "package:clipboard/base/domain/services/database_service.dart";
import 'package:device_info_plus/device_info_plus.dart';
import "package:flutter/foundation.dart";
import "package:focus_window/focus_window.dart";
import "package:injectable/injectable.dart";
import "package:isar_community/isar.dart";
import "package:package_info_plus/package_info_plus.dart";
import 'package:path/path.dart' as p;
import "package:path_provider/path_provider.dart";
import "package:supabase_flutter/supabase_flutter.dart";
import "package:tiny_storage/tiny_storage.dart";
import "package:universal_io/io.dart";

@module
abstract class RegisterModule {
  @preResolve
  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  @singleton
  FocusWindow get focusWindow => FocusWindow();

  @Named("supabase_url")
  String get supabaseUrl => const String.fromEnvironment("SUPABASE_URL");

  @Named("supabase_key")
  String get supabaseKey => const String.fromEnvironment("SUPABASE_KEY");

  @Named("supabase_project_key")
  String get supabaseProjectKey => const String.fromEnvironment("PROJECT_KEY");

  @preResolve
  @singleton
  Future<SupabaseClient> client(
    @Named("supabase_url") String url,
    @Named("supabase_key") String key,
  ) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final userAgent =
        "CopyCat/${packageInfo.version}+${packageInfo.buildNumber} "
        "(${Platform.operatingSystem}; ${Platform.operatingSystemVersion}; "
        "${Platform.localeName}; Installer: "
        "${packageInfo.installerStore ?? 'Unknown Store'})";

    await Supabase.initialize(
      url: url,
      publishableKey: key,
      debug: kDebugMode,
      headers: {"user-agent": userAgent},
      httpClient: SupabaseHttpClient(),
    );
    return Supabase.instance.client;
  }

  @preResolve
  @singleton
  Future<TinyStorage> localCache() async {
    final appDir = await getApplicationDocumentsDirectory();
    final cacheDir = p.join(appDir.path, "cache");
    final storage = await TinyStorage.init("local_cache.json", path: cacheDir);
    return storage;
  }

  @preResolve
  @LazySingleton(dispose: closeIsarDb)
  Future<Isar> get db async {
    String? dbPath = Platform.environment[dbPathEnvKey];
    dbPath = dbPath ?? (await getApplicationDocumentsDirectory()).path;
    await openIsarDatabase(dbPath, dbName);
    return Isar.getInstance(dbName)!;
  }

  @LazySingleton()
  DatabaseService databaseService(Isar db) => IsarDatabaseService(db);

  @preResolve
  @Named("device_id")
  Future<String> deviceId(TinyStorage cache) async {
    const deviceIdKey = r"$$DEVICE_ID_KEY$$";
    final deviceInfo = DeviceInfoPlugin();

    String? platformDeviceId;

    if (Platform.isAndroid) {
      platformDeviceId = (await deviceInfo.androidInfo).id;
    } else if (Platform.isIOS) {
      platformDeviceId = (await deviceInfo.iosInfo).identifierForVendor;
    } else if (Platform.isMacOS) {
      platformDeviceId = (await deviceInfo.macOsInfo).systemGUID;
    } else if (Platform.isWindows) {
      platformDeviceId = (await deviceInfo.windowsInfo).deviceId;
    } else if (Platform.isLinux) {
      platformDeviceId = (await deviceInfo.linuxInfo).machineId;
    }

    String? deviceId_ = (platformDeviceId ?? cache.get<String?>(deviceIdKey));

    return deviceId_ ?? "unknown_device_id";
  }

  @LazySingleton()
  AndroidBackgroundClipboard get bgService =>
      const AndroidBackgroundClipboard();
}

Future<void> closeIsarDb(Isar db) async {
  await db.close();
}
