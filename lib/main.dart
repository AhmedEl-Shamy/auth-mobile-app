import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/core/utils/colors.dart';
import 'package:auth_mobile_app/core/utils/dependency_injection.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const AuthMobileApp());
}

class AuthMobileApp extends StatelessWidget {
  const AuthMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LogInOutCubit>(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'Auth Mobile App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ThemeColors.appBlueColor,
            brightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}
