import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
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
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create new account',
              style: TextStlyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            CustomFormField(
              controller: usernameController,
              label: 'Username',
              isObsecureText: false,
              focusNode: usernameFocusNode,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(emailFocusNode);
              },
              suffixIconButton: IconButton(
                onPressed: () => usernameController.text = '',
                icon: Icon(
                  Icons.cancel_outlined,
                  color: ThemeColors.appBlackColor.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            CustomFormField(
              controller: emailController,
              label: 'Email',
              isObsecureText: false,
              focusNode: emailFocusNode,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              suffixIconButton: IconButton(
                onPressed: () => emailController.text = '',
                icon: Icon(
                  Icons.cancel_outlined,
                  color: ThemeColors.appBlackColor.withOpacity(0.5),
                ),
              ),
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            PasswordFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _registerFun(context),
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            FormOptionsWidget(
              secondOptionStr: 'Have a problem?',
              secondOptionFun: () {},
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            CustomButton(
              label: 'Register',
              onPressed: () => _registerFun(context),
              backgroundColor: ThemeColors.appBlueColor,
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            const NavigatorWidget(
              statement: 'Already have an account?',
              pageName: 'Log in',
              pageRoute: AppRouter.loginRoute,
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
