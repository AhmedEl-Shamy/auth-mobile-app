import 'package:auth_mobile_app/core/utils/failure.dart';
import 'package:auth_mobile_app/core/utils/text_stlyles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/colors.dart';

Future<dynamic> showErrorMsg(context, Failure failure) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error', style: TextStlyles.title,),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.error,
            color: ThemeColors.appRedColor,
          ),
        ],
      ),
      content: Text(failure.errMsg),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          child: const Text('Ok'),
        )
      ],
    ),
  );
}
