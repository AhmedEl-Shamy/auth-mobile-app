import 'package:auth_mobile_app/config/size_config.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightBlock * 70,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}