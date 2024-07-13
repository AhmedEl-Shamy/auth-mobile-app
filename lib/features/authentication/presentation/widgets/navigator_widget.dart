import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/text_stlyles.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    super.key,
    required this.statement,
    required this.pageName,
    required this.pageRoute,
  });
  final String statement;
  final String pageName;
  final String pageRoute;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          statement,
          style: TextStlyles.normal,
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).pushReplacement(pageRoute);
          },
          child: Text(
            pageName,
            style: TextStlyles.normal.copyWith(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              decorationColor: ThemeColors.authButtonBackground,
            ),
          ),
        ),
      ],
    );
  }
}
