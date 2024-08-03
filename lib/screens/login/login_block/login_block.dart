import 'package:demo_app/screens/login/login_block/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String currentUserName = "saddam@mail.com";
  String currentPassword = "000000";
  LoginBloc() : super(LoginInitial()) {
    // !Event 1 with data
    on<LoginTextChangeEvent>(
      (event, emit) {
        if (event.usernameValue.isEmpty && event.passwordValue.isEmpty) {
          emit(LoginFormInValidState(
              userNameError: 'Please enter username',
              passwordError: 'Please enter password'));
        } else if (event.usernameValue.isNotEmpty &&
            event.passwordValue.isEmpty) {
          emit(LoginFormInValidState(
              userNameError: null, passwordError: 'Please enter password'));
        } else if (event.usernameValue.isEmpty &&
            event.passwordValue.isNotEmpty) {
          emit(LoginFormInValidState(
              userNameError: 'Please enter username', passwordError: null));
        } else {
          emit(LoginFormValidState());
        }
      },
    );

// !Event 2 with state according to logic
    on<LoginFormSubmitEvent>(
      (event, emit) {
        if ((event.usernameData.trim() != currentUserName.trim()) &&
            event.passwordData.trim() != currentPassword.trim()) {
          emit(LoginFormInValidState(
              userNameError: 'Please enter correct username',
              passwordError: 'Please enter correct password'));
        } else if (event.usernameData == currentUserName &&
            event.passwordData.trim() != currentPassword) {
          emit(LoginFormInValidState(
              userNameError: null,
              passwordError: 'Please enter correct password'));
        } else if (event.usernameData != currentUserName &&
            event.passwordData.trim() == currentPassword) {
          emit(LoginFormInValidState(
              userNameError: 'Please enter correct username',
              passwordError: null));
        } else {
          emit(LoginFormSuccessState(successMessage: 'Login Successful'));
        }
      },
    );
  }
}
