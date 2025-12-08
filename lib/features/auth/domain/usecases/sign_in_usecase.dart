import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:Ecommerce/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  final AuthRepo _authRepo;

  SignInUseCase(this._authRepo);

  Future<ApiResult<AuthEntity>> call(
    SignInRequestBody signInRequestBody,
  ) async {
    return await _authRepo.signIn(signInRequestBody);
  }
}
