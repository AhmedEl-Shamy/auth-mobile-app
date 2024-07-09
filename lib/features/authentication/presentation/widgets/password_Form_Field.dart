import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.validator,
  });
  final String? Function(String? value) validator;
  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: 'Password',
      isObsecureText: isObsecureText,
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
      validator: widget.validator
    );
  }
}