import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'log_in_form_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          LoginFormWidget(),
        ],
      ),
    );
  }
}
