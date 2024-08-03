import 'package:demo_app/error_screen.dart';
import 'package:demo_app/screens/home/home_screen.dart';
import 'package:demo_app/screens/login/login_screen.dart';
import 'package:demo_app/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case '/home':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (context) => HomeScreen(arguments: args),
          );
        }
        return MaterialPageRoute(
          builder: (context) => HomeScreen(arguments: const {}),
        );
      case '/login':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (context) => SignInScreen(arguments: args),
          );
        }
        return MaterialPageRoute(
          builder: (context) => SignInScreen(arguments: const {}),
        );
      default:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (context) => ErrorScreen(
              arguments: args,
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(
            arguments: const {},
          ),
        );
    }
  }
}
