import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';

abstract class AuthDataSource {
  Future<ApiResult<AuthEntity>> signUp(SignUpRequestBody signUpRequest);
  Future<ApiResult<AuthEntity>> signIn(SignInRequestBody signUpRequest);
}
