// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SigninScreen extends StatefulWidget {
  late Map<String, dynamic> arguments;
  SigninScreen({super.key, required this.arguments});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! username or email
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@#_]'))
                ],
                decoration: const InputDecoration(
                  prefix: Icon(Icons.person_sharp),
                  prefixIconColor: Colors.purple,
                  labelText: 'Username/Email ID',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  helperText: 'Please enter username/email id',
                  helperStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                  ),
                  hintText: 'saddam@mail.com',
                  // errorText: (state is LoginForm)
                ),
              ),
            ),
            //! password field
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: hidePassword,
                obscuringCharacter: '*',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@#_]'))
                ],
                decoration: InputDecoration(
                  prefix: const Icon(Icons.password),
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

                  // errorText: (state is LoginForm)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: InkWell(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.green,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
