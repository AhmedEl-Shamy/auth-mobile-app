import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../utils/assets_data.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.zero,
        height: SizeConfig.heightBlock * 15,
        width: SizeConfig.heightBlock * 15,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.logo),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}