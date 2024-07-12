import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import 'custom_form_field.dart';
import 'form_options_widget.dart';
import 'navigator_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  RegisterFormWidget({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            CustomFormField(
              controller: emailController,
              label: 'Email',
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
              secondOptionStr: 'Have a problem?',
              secondOptionFun: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: 'Register',
              onPressed: () => _registerFun(context),
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

  void _registerFun(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await context.read<RegisterCubit>().registerUser(
            username: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
          );
    }
  }
}
