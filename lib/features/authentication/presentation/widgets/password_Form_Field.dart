import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import 'custom_form_field.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;
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
