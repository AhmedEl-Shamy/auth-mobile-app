import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.validator,
    this.suffixIconButton,
    required this.hint,
    required this.isObsecureText,
  });

  final String hint;
  final bool isObsecureText;
  final String? Function(String? value) validator;
  final IconButton? suffixIconButton;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObsecureText,
      validator: widget.validator,
      style: TextStlyles.normal,
      cursorColor: ThemeColors.mainTextColor,
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: widget.suffixIconButton,
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
