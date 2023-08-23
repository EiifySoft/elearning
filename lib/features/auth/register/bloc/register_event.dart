abstract class RegisterEvent {
  RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  String? username;

  UsernameEvent({this.username});
}

class EmailEvent extends RegisterEvent {
  String? email;

  EmailEvent({this.email});
}

class PasswordEvent extends RegisterEvent {
  String? password;

  PasswordEvent({this.password});
}

class VerifyPasswordEvent extends RegisterEvent {
  String? verifyPassword;

  VerifyPasswordEvent({this.verifyPassword});
}

class PasswordObscureText extends RegisterEvent {
  bool? passwordObscureText;
  PasswordObscureText({this.passwordObscureText});
}

class VerifyPasswordObscureText extends RegisterEvent {
  bool? verifyPasswordObsecureText;
  VerifyPasswordObscureText({this.verifyPasswordObsecureText});
}
