import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../utils/assets_data.dart';

class LogoBackgroundWidget extends StatelessWidget {
  const LogoBackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: double.infinity,
      height: SizeConfig.heightBlock * 22.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AssetsData.backgroundLogo,
          ),
        ),
      ),
    );
  }
}
