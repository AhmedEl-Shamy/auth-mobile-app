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
    this.textInputAction,
    this.textInputType,
    this.focusNode, this.onFieldSubmitted,
  });

  final String label;
  final bool isObsecureText;
  final IconButton? suffixIconButton;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
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
          focusNode: focusNode,
          textInputAction: textInputAction,
          textInputType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
