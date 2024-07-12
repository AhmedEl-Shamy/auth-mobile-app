import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/custom_profile_info_field.dart';
import 'package:flutter/material.dart';

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${user.userFirstName} ${user.userlastName}',
            style: TextStlyles.title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Username',
            value: user.userName,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Email',
            value: user.userEmail,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Gender',
            value: user.userGender,
          ),
        ],
      ),
    );
  }
}
