import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_stlyles.dart';
import 'remember_me_checked_button.dart';

class FormOptionsWidget extends StatelessWidget {
  const FormOptionsWidget({super.key, required this.secondOptionStr, required this.secondOptionFun});
  final String secondOptionStr;
  final void Function() secondOptionFun;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RememberMeCheckButton(),
        InkWell(
          onTap: secondOptionFun,
          child: Text(
            secondOptionStr,
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