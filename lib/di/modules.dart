import "package:appwrite/appwrite.dart";
import "package:clipboard/db/app_config/appconfig.dart";
import "package:clipboard/db/clipboard_item/clipboard_item.dart";
import "package:injectable/injectable.dart";
import "package:isar/isar.dart";
import "package:path_provider/path_provider.dart";

@module
abstract class RegisterModule {
  @singleton
  Client get client => Client()
    ..setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('660c3aced8bf66564dec')
        .setSelfSigned(
          status: true,
        ); // For self signed certificates, only use for development;

  @lazySingleton
  Account account(Client client) => Account(client);

  @preResolve
  @LazySingleton(dispose: closeIsarDb)
  Future<Isar> get db async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        ClipboardItemSchema,
        AppConfigSchema,
      ],
      directory: dir.path,
      relaxedDurability: true,
      inspector: true,
      name: "Clipboard-Cache2",
    );
    return isar;
  }
}

Future<void> closeIsarDb(Isar db) async {
  await db.close();
}
