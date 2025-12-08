import 'package:Ecommerce/core/api_layer/api_result/api_result.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_in_request.dart';
import 'package:Ecommerce/features/auth/data/models/request/sign_up_request.dart';
import 'package:Ecommerce/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:Ecommerce/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;

  AuthCubit(this._signUpUseCase, this._signInUseCase) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final result = await _signInUseCase(
      SignInRequestBody(email: email, password: password),
    );
    switch (result) {
      case ApiSuccessResult():
        emit(AuthSuccess());
      case ApiErrorResult():
        emit(AuthError(result.errorMessage));
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    emit(AuthLoading());
    final result = await _signUpUseCase(
      SignUpRequestBody(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      ),
    );
    switch (result) {
      case ApiSuccessResult():
        emit(AuthSuccess());
      case ApiErrorResult():
        emit(AuthError(result.errorMessage));
    }
  }
}
