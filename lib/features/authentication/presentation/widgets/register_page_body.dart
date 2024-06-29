import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'register_form_widget.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          RegisterFormWidget(),
        ],
      ),
    );
  }
}
