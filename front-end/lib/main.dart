import 'package:flutter/material.dart';
import 'package:flutter_application_test/presentation/auth/login.dart';
import 'package:flutter_application_test/presentation/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portal App',
        home: LoginPage());
  }
}
