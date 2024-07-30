// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  late Map<String, dynamic> arguments;
  HomeScreen({
    super.key,
    required this.arguments,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> modifiableArguments;

  @override
  void initState() {
    super.initState();
    modifiableArguments = Map<String, dynamic>.from(widget.arguments);
    modifiableArguments['name'] ??= 'Guest';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${modifiableArguments['name']}'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
