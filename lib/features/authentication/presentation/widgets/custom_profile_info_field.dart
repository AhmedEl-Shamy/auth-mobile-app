import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_stlyles.dart';

class CustomProfileInfoField extends StatelessWidget {
  const CustomProfileInfoField({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: TextStlyles.normal.copyWith(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeColors.appBlackColor.withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SelectableText(
            value,
            style: TextStlyles.normal,
          ),
        )
      ],
    );
  }
}
