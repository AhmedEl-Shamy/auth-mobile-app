import 'package:auth_mobile_app/config/size_config.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/register_page_body.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: RegisterPageBody(),
    );
  }
}
