import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/core/functions/error_msg_fun.dart';
import 'package:auth_mobile_app/core/widgets/custom_loading_widget.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'register_form_widget.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                GoRouter.of(context).pushReplacement(AppRouter.loginRoute);
              } else if (state is RegisterFailed) {
                showErrorMsg(context, state.failure);
              }
            },
            builder: (context, state) {
              if (state is RegisterLoading) {
                return const CustomLoadingWidget();
              } else {
                return RegisterFormWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
