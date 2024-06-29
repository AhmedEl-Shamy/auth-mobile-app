import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_stlyles.dart';
import 'remember_me_checked_button.dart';

class LogInOptionsWidget extends StatelessWidget {
  const LogInOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeCheckButton(),
        InkWell(
          child: Text(
            'Forgot password?',
            style: TextStlyles.normal.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: ThemeColors.authButtonBackground,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}