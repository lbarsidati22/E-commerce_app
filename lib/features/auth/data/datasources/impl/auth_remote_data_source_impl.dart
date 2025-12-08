import 'package:Ecommerce/core/api_layer/api_client/api_client.dart';
import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:Ecommerce/core/resources/app_constants.dart';
import 'package:Ecommerce/features/auth/data/datasources/contract/auth_data_source.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/data/models/response/sign_in_response.dart';
import 'package:Ecommerce/features/auth/data/models/response/sign_up_response.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthRemoteDataSourceImpl implements AuthDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<AuthEntity>> signIn(SignInRequestBody signInRequest) async {
    try {
      SignInResponse signInResponse = await _apiClient.signIn(signInRequest);
      if (signInResponse.token != null) {
        await SharedPrefHelper().setString(
          key: AppConstants.tokenKey,
          stringValue: signInResponse.token!,
        );
      }

      return ApiSuccessResult(signInResponse.user!.toEntity());
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<AuthEntity>(message.toString());
        }
        return ApiErrorResult<AuthEntity>(e.message ?? e.toString());
      }
      return ApiErrorResult<AuthEntity>(e.toString());
    }
  }

  @override
  Future<ApiResult<AuthEntity>> signUp(SignUpRequestBody signUpRequest) async {
    try {
      SignUpResponse signUpResponse = await _apiClient.signUp(signUpRequest);
      if (signUpResponse.token != null) {
        await SharedPrefHelper().setString(
          key: AppConstants.tokenKey,
          stringValue: signUpResponse.token!,
        );
      }

      return ApiSuccessResult(signUpResponse.user!.toEntity());
    } catch (e) {
      if (e is DioException) {
        final responseData = e.response?.data;
        if (responseData != null && responseData is Map<String, dynamic>) {
          final message = responseData["message"] ?? "Unknown error";
          return ApiErrorResult<AuthEntity>(message.toString());
        }
        return ApiErrorResult<AuthEntity>(e.message ?? e.toString());
      }
      return ApiErrorResult<AuthEntity>(e.toString());
    }
  }
}
