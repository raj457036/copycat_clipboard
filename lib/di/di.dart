import 'package:copycat_base/di/di.module.dart';
import 'package:copycat_pro/di/di.module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
  throwOnMissingDependencies: true,
  externalPackageModulesBefore: [
    ExternalModule(CopycatProPackageModule),
    ExternalModule(CopycatBasePackageModule),
  ],
)
Future<void> configureDependencies() async => await sl.init();
