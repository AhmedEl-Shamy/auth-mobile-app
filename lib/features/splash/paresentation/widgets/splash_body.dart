import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/app_router.dart';
import '../../../../core/functions/error_msg_fun.dart';
import '../../../../core/widgets/app_bar_logo.dart';
import '../../../authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';

class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody> {
  @override
  void initState() {
    context.read<LogInOutCubit>().logInWithToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInOutCubit, LogInOutState>(
      listener: _listener,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoWidget(),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  void _listener(context, state) async {
    if (state is LogInSucsses) {
      GoRouter.of(context).pushReplacement(
        AppRouter.profileRoute,
        extra: state.user,
      );
    } else if (state is LogInOutFailed) {
      await showErrorMsg(context, state.failure);
      GoRouter.of(context).pushReplacement(AppRouter.loginRoute);
    } else {
      GoRouter.of(context).pushReplacement(AppRouter.loginRoute);
    }
  }

  
}
