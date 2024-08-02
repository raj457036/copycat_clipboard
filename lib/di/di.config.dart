// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clipboard/di/modules.dart' as _i7;
import 'package:copycat_base/di/di.module.dart' as _i4;
import 'package:copycat_pro/di/di.module.dart' as _i3;
import 'package:focus_window/focus_window.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:package_info_plus/package_info_plus.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CopycatProPackageModule().init(gh);
    await _i4.CopycatBasePackageModule().init(gh);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i5.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    gh.singleton<_i6.FocusWindow>(() => registerModule.focusWindow);
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {}
