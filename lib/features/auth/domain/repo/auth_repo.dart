import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<AuthEntity>> signIn(SignInRequestBody signInRequest);
  Future<ApiResult<AuthEntity>> signUp(SignUpRequestBody signUpRequest);
}
