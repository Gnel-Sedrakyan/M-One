// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'application/auth/auth_store.dart' as _i12;
import 'domain/auth/i_auth_facade.dart' as _i10;
import 'infrastructure/auth/auth_facade.dart' as _i11;
import 'infrastructure/auth/data_sources/auth_data_source/i_auth_data_source.dart'
    as _i4;
import 'infrastructure/auth/data_sources/auth_data_source/test_data_source.dart'
    as _i5;
import 'infrastructure/auth/data_sources/user_data_source/i_user_data_source.dart'
    as _i6;
import 'infrastructure/auth/data_sources/user_data_source/local_data_source.dart'
    as _i7;
import 'infrastructure/auth/repositories/auth_repository.dart' as _i9;
import 'infrastructure/auth/repositories/i_auth_repository.dart' as _i8;
import 'infrastructure/core/injectable_module.dart' as _i13;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final coreFirebaseInjectableModule = _$CoreFirebaseInjectableModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
      () => coreFirebaseInjectableModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i4.IAuthDataSource>(
      () => _i5.AuthTestDataSource(
          sharedPreferences: get<_i3.SharedPreferences>()),
      registerFor: {_dev, _test});
  gh.lazySingleton<_i6.IUserDataSource>(() =>
      _i7.AuthLocalDataSource(sharedPreferences: get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i8.IAuthDataRepository>(() => _i9.AuthDataRepository(
      userDataSource: get<_i6.IUserDataSource>(),
      authDataSource: get<_i4.IAuthDataSource>()));
  gh.lazySingleton<_i10.IAuthFacade>(
      () => _i11.AuthFacade(get<_i8.IAuthDataRepository>()));
  gh.lazySingleton<_i12.AuthStore>(
      () => _i12.AuthStore(authFacade: get<_i10.IAuthFacade>()));
  return get;
}

class _$CoreFirebaseInjectableModule extends _i13.CoreFirebaseInjectableModule {
}
