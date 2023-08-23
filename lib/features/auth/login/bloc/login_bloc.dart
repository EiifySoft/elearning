import 'dart:async';

import 'package:elearning/features/auth/login/bloc/login_event.dart';
import 'package:elearning/features/auth/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    print("Login bloc created");
    on(_emailEvent);
    on(_passwordEvent);
    on(_obscureEvent);
  }
  FutureOr<void> _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copywith(email: event.email));
  }

  FutureOr<void> _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copywith(password: event.password));
  }

  FutureOr<void> _obscureEvent(
      ObscureTextEvent event, Emitter<LoginState> emit) {
    emit(state.copywith(isObscureText: event.isObscureText));
  }
}
