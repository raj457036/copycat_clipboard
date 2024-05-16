import "package:clipboard/db/app_config/appconfig.dart";
import "package:clipboard/db/clip_collection/clipcollection.dart";
import "package:clipboard/db/clipboard_item/clipboard_item.dart";
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
      ],
      directory: dir.path,
      relaxedDurability: true,
      inspector: true,
      name: "Clipboard-Cache2",
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
  String get supabaseUrl => "https://jyawrokzkzfjturwttte.supabase.co";

  // TODO!: put this in enviornment
  @Named("supabase_key")
  String get supabaseKey =>
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp5YXdyb2t6a3pmanR1cnd0dHRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTMxMTU2NTAsImV4cCI6MjAyODY5MTY1MH0.zEY_hQyUEmFra4Tym-e81nAJZoyt_WafCkBmKKvl9L4";

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
