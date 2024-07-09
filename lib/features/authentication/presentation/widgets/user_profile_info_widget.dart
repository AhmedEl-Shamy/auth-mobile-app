import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/custom_profile_info_field.dart';
import 'package:flutter/material.dart';

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Ahmed Osama',
            style: TextStlyles.title,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Username',
            value: 'AhmedOsama',
          ),
          SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Email',
            value: 'ahmedosama@gmail.com',
          ),
          SizedBox(
            height: 20,
          ),
          CustomProfileInfoField(
            label: 'Gender',
            value: 'Mail',
          ),
        ],
      ),
    );
  }
}
