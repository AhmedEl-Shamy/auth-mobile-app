import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.validator,
    this.suffixIconButton,
    required this.isPassword, required this.hint,
  });

  late bool isHiddenText;
  final String hint;
  final bool isPassword;
  final String? Function(String? value) validator;
  final IconButton? suffixIconButton;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  void initState() {
    super.initState();
    widget.isHiddenText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isHiddenText,
      validator: widget.validator,
      style: TextStlyles.normal,
      cursorColor: ThemeColors.mainTextColor,
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: (widget.isPassword && widget.suffixIconButton == null)
            ? IconButton(
                icon: (widget.isHiddenText)
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
                    widget.isHiddenText = !widget.isHiddenText;
                  });
                },
              )
            : widget.suffixIconButton,
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
