import 'package:auth_mobile_app/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(const AuthMobileApp());
}

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Auth Mobile App',
      home: LoginPage(),
    );
  }
}