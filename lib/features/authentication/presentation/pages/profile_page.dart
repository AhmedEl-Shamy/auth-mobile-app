import 'package:auth_mobile_app/config/size_config.dart';
import 'package:auth_mobile_app/features/authentication/presentation/widgets/profile_page_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return const Scaffold(
      body: ProfilePageBody(),
    );
  }
}
