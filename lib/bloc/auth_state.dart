part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uuid;

  AuthSuccess({required this.uuid});
}

final class AuthFailure extends AuthState {
  final String errMsg;

  AuthFailure({required this.errMsg});
}

final class AuthLoading extends AuthState {}
