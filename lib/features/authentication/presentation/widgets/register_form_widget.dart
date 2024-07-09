import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_form_field.dart';
import 'form_options_widget.dart';
import 'navigator_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

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
              'Create new account',
              style: TextStlyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: 'Username',
              isObsecureText: false,
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
              label: 'Email',
              isObsecureText: false,
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
            PasswordFormField(
              validator: (value) => null,
            ),
            const SizedBox(
              height: 20,
            ),
            FormOptionsWidget(
              secondOptionStr: 'Have a problem?',
              secondOptionFun: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Register',
              onPressed: () {},
              backgroundColor: ThemeColors.authButtonBackground,
            ),
            const SizedBox(
              height: 20,
            ),
            const NavigatorWidget(
              statement: 'Already have an account?',
              pageName: 'Log in',
              pageRoute: '/',
            ),
          ],
        ),
      ),
    );
  }
}
