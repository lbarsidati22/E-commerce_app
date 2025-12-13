part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthEntity user;
  AuthSuccess(this.user);
}

final class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}
