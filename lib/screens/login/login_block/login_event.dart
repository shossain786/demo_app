// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginEvent {}

// ! Event1
class LoginTextChangeEvent extends LoginEvent {
  late String usernameValue;
  late String passwordValue;
  LoginTextChangeEvent({
    required this.usernameValue,
    required this.passwordValue,
  });
}

// ! Event2
class LoginFormSubmitEvent extends LoginEvent {
  late String usernameData;
  late String passwordData;
  LoginFormSubmitEvent({
    required this.usernameData,
    required this.passwordData,
  });
  
}
