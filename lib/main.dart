import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/dependency_injection.dart';
import 'package:auth_mobile_app/features/authentication/presentation/pages/login_page.dart';
// import 'package:auth_mobile_app/features/authentication/presentation/pages/profile_page.dart';
// import 'package:auth_mobile_app/features/authentication/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const AuthMobileApp());
}

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Mobile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: ThemeColors.authButtonBackground,
            brightness: Brightness.light),
      ),
      home: const LoginPage(),
    );
  }
}
