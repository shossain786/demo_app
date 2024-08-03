import 'package:demo_app/global/internet_cubic.dart';
import 'package:demo_app/screens/login/login_block/login_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_file.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubic()),
        BlocProvider(create: (context) => LoginBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Demo APP',
        initialRoute: '/',
        onGenerateRoute: RouterClass.generateRoute,
      ),
    );
  }
}
