import 'package:elearning/common/colors/index.dart';
import 'package:elearning/common/sizedbox/index.dart';
import 'package:elearning/common/style/index.dart';
import 'package:elearning/common/widgets/index.dart';
import 'package:elearning/features/auth/login/bloc/index.dart';
import 'package:elearning/features/auth/login/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: AppTextStyle.style20(
          text: "E L E A R N I N G",
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(size.width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppSizedBox.sizedBoxHeight75(),
              buildTitleBody(size),
              AppSizedBox.sizedBoxHeight75(),
              buildTextFieldBody(size),
              AppSizedBox.sizedBoxHeight20(),
              buildBottomBodyText()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleBody(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextStyle.style24(
          text: "Welcome Back!",
          fontWeight: FontWeight.w600,
        ),
        AppTextStyle.style16(
            text: "Login and start your journey.",
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlackColor.withOpacity(0.5)),
      ],
    );
  }

  Widget buildTextFieldBody(Size size) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            reusableTextField(
              size,
              context,
              controller: emailController,
              onChanged: (value) {
                context.read<LoginBloc>().add(EmailEvent(email: value));
              },
              keyboardType: TextInputType.emailAddress,
              hintText: "Email address",
              prefixIcon: Icons.email,
            ),
            AppSizedBox.sizedBoxHeight30(),
            reusableTextField(
              size,
              context,
              controller: passwordController,
              onChanged: (value) {
                context.read<LoginBloc>().add(PasswordEvent(password: value));
              },
              keyboardType: TextInputType.emailAddress,
              hintText: "Password",
              obscureText: state.isObscureText,
              prefixIcon: Icons.lock,
              sufixIcon: IconButton(
                onPressed: () {
                  state.isObscureText = !state.isObscureText;
                  context.read<LoginBloc>().add(ObscureTextEvent());
                },
                icon: Icon(
                  state.isObscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.lightPinkColor.withOpacity(0.5),
                ),
              ),
            ),
            AppSizedBox.sizedBoxHeight60(),
            state.isLoading == false
                ? reusableElevatedButton(size, onPressed: () async {
                    await LoginRepository(context: context).handleLogin();
                  }, lable: "Login")
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      },
    );
  }

  Widget buildBottomBodyText() {
    return Row(
      children: [
        AppTextStyle.style16(text: "Don't have an account?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/register");
          },
          child: AppTextStyle.style16(
              text: "Register Now.", color: AppColors.darkBrownColor),
        ),
      ],
    );
  }
}
