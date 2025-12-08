import 'package:Ecommerce/features/auth/data/datasources/contract/auth_remote_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRemoteDataSource _authDataSource;

  AuthCubit(this._authDataSource) : super(AuthInitial());

  // Future<void> login(String email, String password) async {
  //   emit(AuthLoading());
  //   try {
  //     await _authDataSource.signInWithEmail(email, password);
  //     //final user = _authDataSource.fetchRawUser();
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }

  // Future<void> register(String name, String email, String password) async {
  //   emit(AuthLoading());
  //   try {
  //     await _authDataSource.signUpWithEmail(
  //       email: email,
  //       password: password,
  //       name: name,
  //     );
  //     //  final user = _authDataSource.fetchRawUser();
  //     emit(AuthSuccess());
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }

  // Future<void> signOut() async {
  //   try {
  //     await _authDataSource.signOut();
  //     emit(AuthInitial());
  //   } catch (e) {
  //     emit(AuthError(e.toString()));
  //   }
  // }

  // void checkUserAuth() {
  //   final userData = _authDataSource.fetchRawUser();
  //   if (userData != null) {
  //     emit(AuthSuccess());
  //   }
  // }
}
