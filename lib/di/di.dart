import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  generateForDir: [
    "lib",
    "packages/copycat_pro/lib",
  ],
)
Future<void> configureDependencies() async => await sl.init();
