import 'package:clipboard/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

@Injectable()
class DB {
  /// The Store of this app.
  late final Store store;
  final Admin? admin;

  DB._create(this.store, this.admin);

  /// Create an instance of ObjectBox to use throughout the app.
  @FactoryMethod(preResolve: true)
  static Future<DB> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store =
        await openStore(directory: p.join(docsDir.path, "app-database"));

    Admin? admin;
    if (Admin.isAvailable()) {
      // Keep a reference until no longer needed or manually closed.
      admin = Admin(store);
    }

    return DB._create(store, admin);
  }
}
