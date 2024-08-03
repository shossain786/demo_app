abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFormValidState extends LoginState {}

class LoginFormInValidState extends LoginState {
  final String? userNameError;
  final String? passwordError;
  LoginFormInValidState({
    this.userNameError,
    this.passwordError,
  });
}

class LoginFormSuccessState extends LoginState {
  final String successMessage;
  LoginFormSuccessState({
    required this.successMessage,
  });
}

class LoginFormFailedState extends LoginState {
  late String? usernameErrorMsg;
  late String? passwordErrorMsg;
  LoginFormFailedState({
    this.usernameErrorMsg,
    this.passwordErrorMsg,
  });
}