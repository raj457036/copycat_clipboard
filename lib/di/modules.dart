import "package:clipboard/db/app_config/appconfig.dart";
import "package:clipboard/db/clip_collection/clipcollection.dart";
import "package:clipboard/db/clipboard_item/clipboard_item.dart";
import "package:clipboard/db/subscription/subscription.dart";
import "package:clipboard/db/sync_status/syncstatus.dart";
import "package:flutter/foundation.dart";
import "package:focus_window/focus_window.dart";
import "package:injectable/injectable.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";
import "package:platform_device_id/platform_device_id.dart";
import "package:supabase_flutter/supabase_flutter.dart";

@module
abstract class RegisterModule {
  @preResolve
  @LazySingleton(dispose: closeIsarDb)
  Future<Isar> get db async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        ClipboardItemSchema,
        AppConfigSchema,
        SyncStatusSchema,
        ClipCollectionSchema,
        SubscriptionSchema,
      ],
      directory: dir.path,
      relaxedDurability: true,
      inspector: kDebugMode,
      name: "CopyCat-Clipboard-DB",
    );
    return isar;
  }

  @preResolve
  @Named("device_id")
  Future<String> get deviceId async =>
      (await PlatformDeviceId.getDeviceId) ?? "";

  @singleton
  FocusWindow get focusWindow => FocusWindow();

  @Named("supabase_url")
  String get supabaseUrl => const String.fromEnvironment("SUPABASE_URL");

  @Named("supabase_key")
  String get supabaseKey => const String.fromEnvironment("SUPABASE_KEY");

  @preResolve
  @singleton
  Future<SupabaseClient> client(@Named("supabase_url") String url,
      @Named("supabase_key") String key) async {
    await Supabase.initialize(
      url: url,
      anonKey: key,
      debug: kDebugMode,
    );
    return Supabase.instance.client;
  }
}

Future<void> closeIsarDb(Isar db) async {
  await db.close();
}
