import 'package:flutter/material.dart';

import 'router_file.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Demo APP',
      initialRoute: '/',
      onGenerateRoute: RouterClass.generateRoute,
    );
  }
}
