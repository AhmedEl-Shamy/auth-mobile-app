import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import 'log_in_form_widget.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppBar(),
          BlocConsumer<LogInOutCubit, LogInOutState>(
            listener: (context, state) {
              if (state is LogInSucsses) {
                GoRouter.of(context).pushReplacement(
                  AppRouter.profileRoute,
                  extra: state.user,
                );
              }
            },
            builder: (context, state) {
              if (state is LogInOutLoading) {
                return const CustomLoadingWidget();
              } else {
                return LoginFormWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
