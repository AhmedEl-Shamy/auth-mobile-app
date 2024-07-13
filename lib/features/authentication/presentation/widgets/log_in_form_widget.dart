import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/constants.dart';
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
  final FocusNode usernameFocusNode = FocusNode();
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
              'Log in to your account',
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
                FocusScope.of(context).requestFocus(passwordFocusNode);
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
            PasswordFormField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _logInFun(context),
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            FormOptionsWidget(
              secondOptionStr: 'Forgot password?',
              secondOptionFun: () {},
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            CustomButton(
              label: 'Log in',
              onPressed: () => _logInFun(context),
              backgroundColor: ThemeColors.appBlueColor,
            ),
            const SizedBox(
              height: AppConstants.spaceBetweenFormFields,
            ),
            const NavigatorWidget(
              statement: 'Don’t have an account?',
              pageName: 'Register',
              pageRoute: AppRouter.registerRoute,
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
