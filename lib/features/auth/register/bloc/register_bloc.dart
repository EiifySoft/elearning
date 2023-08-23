import 'dart:async';

import 'package:elearning/features/auth/register/bloc/register_event.dart';
import 'package:elearning/features/auth/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    print("Register bloc created");
    on(_usernameEvent);
    on(_emailEvent);
    on(_passwordEvent);
    on(_verifyPasswordEvent);
    on(_passwordObscureTextEvent);
    on(_verifyPasswordObscureTextEvent);
  }

  FutureOr<void> _usernameEvent(
      UsernameEvent event, Emitter<RegisterState> emit) {
    emit(state.copywith(username: event.username));
  }

  FutureOr<void> _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copywith(email: event.email));
  }

  FutureOr<void> _passwordEvent(
      PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copywith(password: event.password));
  }

  FutureOr<void> _verifyPasswordEvent(
      VerifyPasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copywith(verifyPassword: event.verifyPassword));
  }

  FutureOr<void> _passwordObscureTextEvent(
      PasswordObscureText event, Emitter<RegisterState> emit) {
    emit(state.copywith(passwordObscureText: event.passwordObscureText));
  }

  FutureOr<void> _verifyPasswordObscureTextEvent(
      VerifyPasswordObscureText event, Emitter<RegisterState> emit) {
    emit(state.copywith(passwordObscureText: event.verifyPasswordObsecureText));
  }
}
