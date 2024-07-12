import 'package:auth_mobile_app/config/size_config.dart';
import 'package:auth_mobile_app/core/utils/dependency_injection.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/register_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl.get<RegisterCubit>(),
        child: const RegisterPageBody(),
      ),
    );
  }
}
