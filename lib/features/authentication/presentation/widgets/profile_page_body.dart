import 'package:auth_mobile_app/config/app_router.dart';
import 'package:auth_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:auth_mobile_app/features/authentication/presentation/controllers/log_in_out_cubit/log_in_out_cubit.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/user_profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../domain/entities/user_entity.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          imageUrl: user.userImage,
        ),
        UserProfileInfoWidget(
          user: user,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomButton(
            label: 'Log out',
            onPressed: () => _logOutFun(context),
            backgroundColor: ThemeColors.appRedColor,
          ),
        ),
      ],
    );
  }

  void _logOutFun(BuildContext context) async {
    await context.read<LogInOutCubit>().logOut();
    if (context.mounted) {
      GoRouter.of(context).pushReplacement(AppRouter.loginRoute);
    }
  }
}
