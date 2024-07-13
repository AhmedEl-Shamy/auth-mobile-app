import 'package:flutter/material.dart';

import 'app_logo_widget.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AppLogo(
          imageUrl: imageUrl ?? '',
        ),
      ),
    );
  }
}


