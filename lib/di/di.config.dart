// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:android_background_clipboard/android_background_clipboard.dart'
    as _i565;
import 'package:clipboard/di/modules.dart' as _i234;
import 'package:copycat_base/di/di.module.dart' as _i511;
import 'package:copycat_pro/di/di.module.dart' as _i32;
import 'package:focus_window/focus_window.dart' as _i291;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i32.CopycatProPackageModule().init(gh);
    await _i511.CopycatBasePackageModule().init(gh);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i655.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    gh.singleton<_i291.FocusWindow>(() => registerModule.focusWindow);
    gh.lazySingleton<_i565.AndroidBackgroundClipboard>(
        () => registerModule.bgService);
    return this;
  }
}

class _$RegisterModule extends _i234.RegisterModule {}
