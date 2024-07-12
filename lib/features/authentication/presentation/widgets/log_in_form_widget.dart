import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_form_field.dart';
import 'form_options_widget.dart';
import 'navigator_widget.dart';
import 'password_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
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
              controller: usernameController,
              label: 'Username',
              isObsecureText: false,
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
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            FormOptionsWidget(
              secondOptionStr: 'Forgot password?',
              secondOptionFun: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Log in',
              onPressed: () => _logInFun(context),
              backgroundColor: ThemeColors.authButtonBackground,
            ),
            const SizedBox(
              height: 20,
            ),
            const NavigatorWidget(
              statement: 'Don’t have an account?',
              pageName: 'Register',
              pageRoute: '/',
            ),
          ],
        ),
      ),
    );
  }

  void _logInFun(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await context.read<LogInOutCubit>().logIn(
            username: usernameController.text,
            password: passwordController.text,
          );
    }
  }
}
