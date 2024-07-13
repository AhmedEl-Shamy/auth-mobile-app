import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.suffixIconButton,
    required this.hint,
    required this.isObsecureText,
    required this.controller,
    this.textInputAction,
    this.textInputType,
    this.focusNode, this.onFieldSubmitted,
  });

  final String hint;
  final bool isObsecureText;
  final IconButton? suffixIconButton;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

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
      controller: widget.controller,
      obscureText: widget.isObsecureText,
      validator: _validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStlyles.normal,
      cursorColor: ThemeColors.appBlackColor,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
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

  String? _validator(String? value) {
    if (value?.isEmpty ?? false) {
      return 'This is a required Field!';
    } else {
      return null;
    }
  }
}
