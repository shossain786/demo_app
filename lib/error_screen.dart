// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  late Map<String, dynamic> arguments;
  ErrorScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Something went wrong.'),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Go to home'),
              icon: const Icon(Icons.home),
            )
          ],
        ),
      ),
    );
  }
}
