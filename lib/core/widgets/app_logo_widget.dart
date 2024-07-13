import 'package:flutter/material.dart';

import '../../config/size_config.dart';
import '../utils/assets_data.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: SizeConfig.heightBlock * 15,
      width: SizeConfig.heightBlock * 15,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: (imageUrl.isNotEmpty)
              ? NetworkImage(imageUrl)
              : const AssetImage(AssetsData.logo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}