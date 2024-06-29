import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
        ],
      ),
    );
  }
}

