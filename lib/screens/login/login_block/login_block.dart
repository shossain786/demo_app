import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final String currentUserName = "saddam@mail.com";
  final String currentPassword = "000000";

  LoginBloc() : super(LoginInitial()) {
    on<LoginTextChangeEvent>((event, emit) {
      if (event.usernameValue.isEmpty && event.passwordValue.isEmpty) {
        emit(LoginFormInValidState(
            userNameError: 'Please enter username',
            passwordError: 'Please enter password'));
      } else if (event.usernameValue.isNotEmpty && event.passwordValue.isEmpty) {
        emit(LoginFormInValidState(
            userNameError: null, passwordError: 'Please enter password'));
      } else if (event.usernameValue.isEmpty && event.passwordValue.isNotEmpty) {
        emit(LoginFormInValidState(
            userNameError: 'Please enter username', passwordError: null));
      } else {
        emit(LoginFormValidState());
      }
    });

    on<LoginFormSubmitEvent>((event, emit) {
      if (event.usernameData.trim() != currentUserName.trim() ||
          event.passwordData.trim() != currentPassword.trim()) {
        emit(LoginFormInValidState(
            userNameError: 'Please enter correct username',
            passwordError: 'Please enter correct password'));
      } else {
        emit(LoginFormSuccessState(successMessage: 'Login Successful'));
      }
    });
  }
}
