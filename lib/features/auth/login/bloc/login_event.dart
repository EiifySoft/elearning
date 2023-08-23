class LoginEvent {}

class EmailEvent extends LoginEvent {
  String? email;

  EmailEvent({this.email});
}

class PasswordEvent extends LoginEvent {
  String? password;

  PasswordEvent({this.password});
}

class ObscureTextEvent extends LoginEvent {
  bool? isObscureText;
  ObscureTextEvent({this.isObscureText});
}
