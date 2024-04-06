// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appwrite/appwrite.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i4;

import '../bloc/auth_cubit/auth_cubit.dart' as _i6;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i7;
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
    gh.singleton<_i3.Client>(() => registerModule.client);
    await gh.lazySingletonAsync<_i4.Isar>(
      () => registerModule.db,
      preResolve: true,
      dispose: _i5.closeIsarDb,
    );
    gh.lazySingleton<_i3.Account>(
        () => registerModule.account(gh<_i3.Client>()));
    gh.singleton<_i6.AuthCubit>(() => _i6.AuthCubit(gh<_i3.Account>()));
    gh.factory<_i7.ClipboardCubit>(() => _i7.ClipboardCubit(
          gh<_i4.Isar>(),
          gh<_i6.AuthCubit>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
