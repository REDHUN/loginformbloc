import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      try {
        emit(AuthLoading());
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          return emit(AuthFailure(errMsg: 'Password cannot be less than 6'));
        }
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthSuccess(uuid: '$email-$password'));
        });
      } catch (e) {
        return emit(AuthFailure(errMsg: e.toString()));
      }
    });
    on<AuthLogoutRequested>((event, emit) async {
      try {
        emit(AuthLoading());
        await Future.delayed(const Duration(seconds: 1), () {
          return emit(AuthInitial());
        });
      } catch (e) {
        emit(AuthFailure(errMsg: e.toString()));
      }
    });
  }
}
