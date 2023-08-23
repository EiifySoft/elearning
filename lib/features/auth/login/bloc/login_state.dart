class LoginState {
  String email;
  String password;
  bool isObscureText;
  LoginState({this.email = "", this.password = "", this.isObscureText = true});

  LoginState copywith({String? email, String? password, bool? isObscureText}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isObscureText: isObscureText ?? this.isObscureText,
    );
  }
}
