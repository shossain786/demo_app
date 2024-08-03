// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginState {}

final class LoginInitial extends LoginState{}

class LoginFormValidState extends LoginState {
  
}

class LoginFormInValidState extends LoginState {
  late String? userNameError;
  late String? passwordError;
  LoginFormInValidState({
     this.userNameError,
     this.passwordError,
  });
  
}

class LoginFormLoadState extends LoginState {}

class LoginFormSuccessState extends LoginState {
  late String? successMessage;
  LoginFormSuccessState({
    this.successMessage,
  });
}

class LoginFormFailedState extends LoginState {
  late String? errorMsg;
  LoginFormFailedState({
    this.errorMsg,
  });
}
