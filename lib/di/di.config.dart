// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../db/db.dart' as _i3;
import 'modules.dart' as _i5;

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
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.DB>(
      () => _i3.DB.create(),
      preResolve: true,
    );
    gh.singleton<_i4.Client>(() => registerModule.client);
    gh.factory<_i4.Account>(() => registerModule.account(gh<_i4.Client>()));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
