class LoginState {
  String email;
  String password;
  bool isObscureText;
  bool isLoading;
  LoginState(
      {this.email = "",
      this.password = "",
      this.isObscureText = true,
      this.isLoading = false});

  LoginState copywith(
      {String? email, String? password, bool? isObscureText, bool? isLoading}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        isObscureText: isObscureText ?? this.isObscureText,
        isLoading: isLoading ?? this.isLoading);
  }
}
