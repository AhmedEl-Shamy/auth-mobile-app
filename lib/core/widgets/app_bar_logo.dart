import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../utils/assets_data.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.imageUrl,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.zero,
        height: SizeConfig.heightBlock * 15,
        width: SizeConfig.heightBlock * 15,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: (imageUrl == null)
                ? const AssetImage(AssetsData.logo)
                : NetworkImage(imageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
