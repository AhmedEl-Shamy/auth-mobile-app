import 'package:flutter/material.dart';

import '../../../../core/utils/text_stlyles.dart';
import '../../../../core/widgets/custom_text_field.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    required this.isObsecureText,
    this.suffixIconButton,
  });

  final String label;
  final bool isObsecureText;
  final IconButton? suffixIconButton;
  final TextEditingController controller;
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
        CustomTextFormField(
          controller: controller,
          hint: label,
          isObsecureText: isObsecureText,
          suffixIconButton: suffixIconButton,
        ),
      ],
    );
  }
}
