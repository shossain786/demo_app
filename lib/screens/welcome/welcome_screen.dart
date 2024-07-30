import 'package:demo_app/const_list.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ConsntList.logoImg,
              width: 250,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/home',
                    arguments: {'name': 'Saddam'});
              },
              icon: const Icon(Icons.home),
              label: const Text('Go to home'),
            )
          ],
        ),
      ),
    );
  }
}
