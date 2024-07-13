import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    this.textInputType,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      controller: widget.controller,
      label: 'Password',
      isObsecureText: isObsecureText,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      textInputType: widget.textInputType,
      suffixIconButton: IconButton(
        icon: (isObsecureText)
            ? Icon(
                Icons.visibility_off_outlined,
                color: ThemeColors.mainTextColor.withOpacity(0.5),
              )
            : Icon(
                Icons.visibility_outlined,
                color: ThemeColors.mainTextColor.withOpacity(0.5),
              ),
        onPressed: () {
          setState(() {
            isObsecureText = !isObsecureText;
          });
        },
      ),
    );
  }
}
