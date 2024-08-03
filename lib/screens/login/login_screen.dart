// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:demo_app/global/blocs/internet/internet_cubit.dart';
import 'package:demo_app/global/blocs/internet/internet_state.dart';
import 'package:demo_app/global/widgets/auto_click_button.dart';
import 'package:demo_app/global/widgets/toast_notification.dart';
import 'package:demo_app/screens/login/login_block/login_block.dart';
import 'package:demo_app/screens/login/login_block/login_event.dart';
import 'package:demo_app/screens/login/login_block/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  late Map<String, dynamic> arguments;
  SignInScreen({
    super.key,
    required this.arguments,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      bloc: InternetCubit(),
      listener: (context, state) {
        if (state == InternetState.internetLost) {
          Navigator.pushReplacementNamed(context, '/network-error');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
          centerTitle: true,
        ),
        body: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              child: Center(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    (state is LoginFormSuccessState)
                        ? AutoClickButton.automaticTaskWorker(
                            context: context,
                            taskWaitDuration: Durations.medium3,
                            task: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setBool('isLoggedIn', true);
                              ToastNotifierWidget.showSuccessNotification(
                                  context: context,
                                  message: 'Login Success',
                                  description: state.successMessage);
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          )
                        : Container(),
                    (state is LoginFormFailedState)
                        ? AutoClickButton.automaticTaskWorker(
                            context: context,
                            taskWaitDuration: Durations.medium3,
                            task: () async {
                              if ((state.usernameErrorMsg != null) &&
                                  (state.passwordErrorMsg != null)) {
                                ToastNotifierWidget.showFailureNotification(
                                  context: context,
                                  message: null,
                                  description: 'Invalid credential entered',
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              } else if ((state.usernameErrorMsg == null) &&
                                  (state.passwordErrorMsg != null)) {
                                ToastNotifierWidget.showFailureNotification(
                                  context: context,
                                  message: null,
                                  description: state.passwordErrorMsg,
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              } else if ((state.usernameErrorMsg != null) &&
                                  (state.passwordErrorMsg == null)) {
                                ToastNotifierWidget.showFailureNotification(
                                  context: context,
                                  message: null,
                                  description: state.usernameErrorMsg,
                                );
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              }
                            },
                          )
                        : Container(),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/flower.png',
                          height: 300,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //! username or email
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9@#.-_]'))
                        ],
                        onChanged: (value) {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginTextChangeEvent(
                                usernameValue: _usernameController.text,
                                passwordValue: _passwordController.text),
                          );
                        },
                        decoration: InputDecoration(
                          prefix: const Icon(
                            Icons.person_sharp,
                            color: Colors.purple,
                          ),
                          prefixIconColor: Colors.purple,
                          labelText: 'Username/Email ID',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          helperText: 'Please enter username/email id',
                          helperStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple,
                          ),
                          hintText: 'saddam@mail.com',
                          errorText: (state is LoginFormInValidState)
                              ? state.userNameError
                              : null,
                          errorStyle: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //! password field
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: hidePassword,
                        obscuringCharacter: '*',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9@#_]'),
                          ),
                        ],
                        onChanged: (value) {
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginTextChangeEvent(
                                usernameValue: _usernameController.text,
                                passwordValue: _passwordController.text),
                          );
                        },
                        decoration: InputDecoration(
                          prefix: const Icon(
                            Icons.password,
                            color: Colors.purple,
                          ),
                          prefixIconColor: Colors.purple,
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(
                                () {
                                  hidePassword = !hidePassword;
                                },
                              );
                            },
                            child: Icon(
                              (hidePassword == true)
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          helperText: 'Please enter password',
                          helperStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.deepPurple,
                          ),
                          errorText: (state is LoginFormInValidState)
                              ? state.passwordError
                              : null,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          debugPrint('Login button pressed');
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginFormSubmitEvent(
                              usernameData: _usernameController.text,
                              passwordData: _passwordController.text,
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.deepPurpleAccent,
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
