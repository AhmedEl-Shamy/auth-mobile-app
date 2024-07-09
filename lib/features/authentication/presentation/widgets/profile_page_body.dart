import 'package:auth_mobile_app/core/widgets/custom_app_bar.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/user_profile_info_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/custom_button.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CustomAppBar(),
          const UserProfileInfoWidget(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomButton(
              label: 'Log out',
              onPressed: () {},
              backgroundColor: ThemeColors.logOutButtonBackground,
            ),
          ),
        ],
      ),
    );
  }
}
