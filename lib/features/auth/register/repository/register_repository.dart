// ignore_for_file: use_build_context_synchronously

import 'package:elearning/common/utils/app_snackbar.dart';
import 'package:elearning/features/auth/register/bloc/register_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterRepository {
  final BuildContext context;
  const RegisterRepository({required this.context});

  Future<void> handleRegister() async {
    try {
      final state = context.read<RegisterBloc>().state;
      String username = state.username;
      String email = state.email;
      String password = state.password;
      String verifyPassword = state.verifyPassword;

      if (username.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "Username can not be empty");
      }

      if (email.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "Email address can not be empty");
      }

      if (password.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "Password can not be empty");
      }

      if (verifyPassword.isEmpty) {
        await AppSnackbar.showSnackBar(
            context: context, content: "VerifyPassword can not be empty");
      }

      try {
        final credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        if (credentials.user == null) {
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "User not found or user credentials detail not found in database.");
        }
        if (credentials.user!.emailVerified) {
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "Email address not verified by us. Please check your inbox and verify email address by clickin on link.");
        }
        if (credentials.user != null) {
          await credentials.user?.sendEmailVerification();
          await credentials.user?.updateDisplayName(username);
          AppSnackbar.showSnackBar(
              context: context,
              content:
                  "An email verification link sent your email address. Please follow the link to activate your account");
          Navigator.of(context).pop();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "invalid-email") {
          await AppSnackbar.showSnackBar(
              context: context,
              content: "Email address is invalid or not formated.");
        }
        if (e.code == "email-already-in-use") {
          await AppSnackbar.showSnackBar(
              context: context,
              content:
                  "This email address is already register with another account.");
        }

        if (e.code == "operation-not-allowed") {
          await AppSnackbar.showSnackBar(
              context: context,
              content: "Register user operation not allowed for you.");
        }

        if (e.code == "weak-password") {
          await AppSnackbar.showSnackBar(
              context: context,
              content: "Password is very weak please enter a strong password");
        }
      }
    } catch (e) {
      await AppSnackbar.showSnackBar(content: e.toString());
    }
  }
}
