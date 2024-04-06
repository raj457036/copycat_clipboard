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

import '../bloc/app_config_cubit/app_config_cubit.dart' as _i8;
import '../bloc/auth_cubit/auth_cubit.dart' as _i9;
import '../bloc/clipboard_cubit/clipboard_cubit.dart' as _i10;
import '../repositories/app_config.dart' as _i7;
import '../repositories/clipboard.dart' as _i6;
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
    gh.lazySingleton<_i6.ClipboardRepository>(
        () => _i6.ClipboardRepositoryImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i7.AppConfigRepository>(
        () => _i7.AppConfigRepositoryImpl(gh<_i4.Isar>()));
    gh.lazySingleton<_i3.Account>(
        () => registerModule.account(gh<_i3.Client>()));
    gh.singleton<_i8.AppConfigCubit>(
        () => _i8.AppConfigCubit(gh<_i7.AppConfigRepository>()));
    gh.singleton<_i9.AuthCubit>(() => _i9.AuthCubit(gh<_i3.Account>()));
    gh.factory<_i10.ClipboardCubit>(() => _i10.ClipboardCubit(
          gh<_i6.ClipboardRepository>(),
          gh<_i9.AuthCubit>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i5.RegisterModule {}
