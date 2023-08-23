class RegisterState {
  final String username;
  final String email;
  final String password;
  final String verifyPassword;
  bool passwordObscureText;
  bool verifyPasswordObsecureText;
  RegisterState(
      {this.username = "",
      this.email = "",
      this.password = "",
      this.verifyPassword = "",
      this.passwordObscureText = true,
      this.verifyPasswordObsecureText = true});

  RegisterState copywith(
      {String? username,
      String? email,
      String? password,
      String? verifyPassword,
      bool? passwordObscureText,
      bool? verifyPasswordObsecureText}) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      verifyPassword: verifyPassword ?? this.verifyPassword,
      passwordObscureText: passwordObscureText ?? this.passwordObscureText,
      verifyPasswordObsecureText:
          verifyPasswordObsecureText ?? this.verifyPasswordObsecureText,
    );
  }
}
