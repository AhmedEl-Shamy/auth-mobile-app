import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_form_field.dart';
import 'log_in_options_widget.dart';
import 'register_navigator_button.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Log in to your account',
              style: TextStlyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: 'Username',
              isPassword: false,
              validator: (value) {
                return null;
              },
              suffixIconButton: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cancel_outlined,
                  color: ThemeColors.mainTextColor.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: 'Password',
              isPassword: true,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const LogInOptionsWidget(),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Log in',
              onPressed: () {},
              backgroundColor: ThemeColors.authButtonBackground,
            ),
            const SizedBox(
              height: 20,
            ),
            const RegisterNavigatorButton(),
          ],
        ),
      ),
    );
  }
}
