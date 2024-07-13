import 'package:auth_mobile_app/config/size_config.dart';

import 'package:flutter/material.dart';

import '../widgets/splash_body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: SplashPageBody(),
    );
  }
}
