import 'package:auth_mobile_app/config/size_config.dart';
import 'package:flutter/material.dart';

import '../widgets/log_in_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: LoginPageBody(),
    );
  }
}

