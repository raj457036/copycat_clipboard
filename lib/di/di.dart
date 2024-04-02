import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => await sl.init();
