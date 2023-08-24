// ignore_for_file: use_build_context_synchronously

import 'package:elearning/common/utils/app_snackbar.dart';
import 'package:elearning/features/auth/login/bloc/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRepository {
  final BuildContext context;
  const LoginRepository({required this.context});

  Future<void> handleLogin() async {
    try {
      final state = context.read<LoginBloc>().state;
      String email = state.email;
      String password = state.password;

      if (email.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "Email address can not be empty");
      }

      if (password.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "Password can not be empty");
      }

      try {
        context.read<LoginBloc>().add(IsLoadingEvet(isLoading: true));
        final credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));

        if (credentials.user == null) {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "User not found or user credentials detail not found in database.");
        }

        if (credentials.user!.emailVerified) {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "Email address not verified by us. Please check your inbox and verify email address by clickin on link.");
        }
        if (credentials.user != null) {
          state.isLoading = false;
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/mainview", (route) => false);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "invalid-email") {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content: "Email address is invalid or not formated.");
        }
        if (e.code == "user-not-found") {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "This email address or user not register with us, pleas register now.");
        }

        if (e.code == "wrong-password") {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "Entered password is incorrect. Please enter correct password.");
        }

        if (e.code == "user-disabled") {
          context.read<LoginBloc>().add(IsLoadingEvet(isLoading: false));
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "This email address or user is disabled by administrator.Please contact to administrator for enable yout account.");
        }
      }
    } catch (e) {
      await AppSnackbar.showSnackBar(content: e.toString());
    }
  }
}
