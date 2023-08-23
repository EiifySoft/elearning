import 'package:elearning/common/colors/index.dart';
import 'package:elearning/common/sizedbox/index.dart';
import 'package:elearning/common/style/index.dart';
import 'package:elearning/common/widgets/index.dart';
import 'package:elearning/features/auth/register/bloc/index.dart';
import 'package:elearning/features/auth/register/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
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
              AppSizedBox.sizedBoxHeight30(),
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
          text: "Create a New!",
          fontWeight: FontWeight.w600,
        ),
        AppTextStyle.style16(
            text: "Register and start your journey.",
            fontWeight: FontWeight.w600,
            color: AppColors.darkBlackColor.withOpacity(0.5)),
      ],
    );
  }

  Widget buildTextFieldBody(Size size) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Column(
          children: [
            reusableTextField(
              size,
              context,
              controller: usernameController,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .add(UsernameEvent(username: value));
              },
              hintText: "Username",
              prefixIcon: Icons.person,
            ),
            AppSizedBox.sizedBoxHeight30(),
            reusableTextField(
              size,
              context,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                context.read<RegisterBloc>().add(EmailEvent(email: value));
              },
              hintText: "Email address",
              prefixIcon: Icons.email,
            ),
            AppSizedBox.sizedBoxHeight30(),
            reusableTextField(
              size,
              context,
              controller: passwordController,
              onChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .add(PasswordEvent(password: value));
              },
              keyboardType: TextInputType.emailAddress,
              hintText: "Password",
              obscureText: state.passwordObscureText,
              prefixIcon: Icons.lock,
              sufixIcon: IconButton(
                onPressed: () {
                  state.passwordObscureText = !state.passwordObscureText;
                  context.read<RegisterBloc>().add(PasswordObscureText());
                },
                icon: Icon(
                  state.passwordObscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.lightPinkColor.withOpacity(0.5),
                ),
              ),
            ),
            AppSizedBox.sizedBoxHeight30(),
            reusableTextField(
              size,
              context,
              controller: verifyPasswordController,
              onChanged: (value) {
                context
                    .read<RegisterBloc>()
                    .add(VerifyPasswordEvent(verifyPassword: value));
              },
              keyboardType: TextInputType.emailAddress,
              hintText: "Verify Password",
              obscureText: state.verifyPasswordObsecureText,
              prefixIcon: Icons.key,
              sufixIcon: IconButton(
                onPressed: () {
                  state.verifyPasswordObsecureText =
                      !state.verifyPasswordObsecureText;
                  context.read<RegisterBloc>().add(PasswordObscureText());
                },
                icon: Icon(
                  state.verifyPasswordObsecureText == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.lightPinkColor.withOpacity(0.5),
                ),
              ),
            ),
            AppSizedBox.sizedBoxHeight60(),
            reusableElevatedButton(size, onPressed: () async {
              RegisterRepository(context: context).handleRegister();
            }, lable: "Register"),
          ],
        );
      },
    );
  }

  Widget buildBottomBodyText() {
    return Row(
      children: [
        AppTextStyle.style16(text: "Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: AppTextStyle.style16(
              text: "Login Now.", color: AppColors.darkBrownColor),
        ),
      ],
    );
  }
}
