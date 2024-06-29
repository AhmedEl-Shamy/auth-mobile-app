import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_stlyles.dart';

class RegisterNavigatorButton extends StatelessWidget {
  const RegisterNavigatorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Don’t have an account?',
          style: TextStlyles.normal,
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: (){},
          child: Text(
            'Register',
            style: TextStlyles.normal.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: ThemeColors.authButtonBackground,
            ),
          ),
        ),
      ],
    );
  }
}