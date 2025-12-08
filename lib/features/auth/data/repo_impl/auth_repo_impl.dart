import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/auth/data/datasources/contract/auth_data_source.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:injectable/injectable.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:Ecommerce/features/auth/domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl(this._authDataSource);

  @override
  Future<ApiResult<AuthEntity>> signIn(SignInRequestBody signInRequest) async {
    return await _authDataSource.signIn(signInRequest);
  }

  @override
  Future<ApiResult<AuthEntity>> signUp(SignUpRequestBody signUpRequest) async {
    return await _authDataSource.signUp(signUpRequest);
  }
}
