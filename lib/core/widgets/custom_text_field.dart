import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isHiddenText,
    required this.validator,
    required this.suffixIconButton,
  });

  final bool isHiddenText;
  final String? Function(String? value) validator;
  final IconButton suffixIconButton;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      validator: validator,
      cursorColor: ThemeColors.mainTextColor,
      decoration: InputDecoration(
        isCollapsed: false,
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: suffixIconButton,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.5),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
    );
  }
}
