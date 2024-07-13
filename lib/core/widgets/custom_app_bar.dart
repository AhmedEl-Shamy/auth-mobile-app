import 'package:auth_mobile_app/config/size_config.dart';
import 'package:flutter/material.dart';

import 'app_bar_logo.dart';
import 'logo_background_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: SizeConfig.heightBlock * 30,
      child: Stack(
        children: [
          const LogoBackgroundWidget(),
          LogoWidget(imageUrl: imageUrl,),
        ],
      ),
    );
  }
}
