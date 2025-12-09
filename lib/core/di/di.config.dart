// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/datasources/contract/auth_data_source.dart'
    as _i824;
import '../../features/auth/data/datasources/impl/auth_remote_data_source_impl.dart'
    as _i257;
import '../../features/auth/data/repo_impl/auth_repo_impl.dart' as _i279;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/sign_in_usecase.dart' as _i259;
import '../../features/auth/domain/usecases/sign_up_usecase.dart' as _i860;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../api_layer/api_client/api_client.dart' as _i225;
import '../cubit/app_cubit.dart' as _i145;
import '../modules/dio_module.dart' as _i948;
import '../modules/shared_preferences_module.dart' as _i744;
import '../utils/validator.dart' as _i449;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i528.PrettyDioLogger>(
      () => dioModule.providePrettyDioLogger(),
    );
    gh.singleton<_i744.SharedPrefHelper>(() => _i744.SharedPrefHelper.new());
    gh.lazySingleton<_i449.Validator>(() => _i449.Validator());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(
        gh<_i528.PrettyDioLogger>(),
        gh<_i744.SharedPrefHelper>(),
      ),
    );
    gh.factory<_i145.AppCubit>(
      () => _i145.AppCubit(gh<_i744.SharedPrefHelper>()),
    );
    gh.singleton<_i225.ApiClient>(() => _i225.ApiClient.new(gh<_i361.Dio>()));
    gh.factory<_i824.AuthDataSource>(
      () => _i257.AuthRemoteDataSourceImpl(gh<_i225.ApiClient>()),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i279.AuthRepoImpl(gh<_i824.AuthDataSource>()),
    );
    gh.factory<_i259.SignInUseCase>(
      () => _i259.SignInUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i860.SignUpUseCase>(
      () => _i860.SignUpUseCase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i117.AuthCubit>(
      () =>
          _i117.AuthCubit(gh<_i860.SignUpUseCase>(), gh<_i259.SignInUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i948.DioModule {}
