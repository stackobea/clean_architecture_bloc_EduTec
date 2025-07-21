// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_bloc/features/data/data_sources/login_data_source.dart'
    as _i264;
import 'package:clean_architecture_bloc/features/data/repositories/login_repository_impl.dart'
    as _i979;
import 'package:clean_architecture_bloc/features/domain/repositories/login_repository.dart'
    as _i863;
import 'package:clean_architecture_bloc/features/domain/use_cases/user_login.dart'
    as _i787;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i264.LoginDataSource>(() => _i264.LoginDataSourceImpl());
    gh.lazySingleton<_i863.LoginRepository>(
      () => _i979.LoginRepositoryImpl(gh<_i264.LoginDataSource>()),
    );
    gh.factory<_i787.UserLogin>(
      () => _i787.UserLogin(gh<_i863.LoginRepository>()),
    );
    return this;
  }
}
