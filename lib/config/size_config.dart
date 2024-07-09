import 'package:flutter/material.dart';

class SizeConfig {
  static late double width;
  static late double height;
  static late double widthBlock;
  static late double heightBlock;

  static void init(BuildContext context) {
    MediaQueryData data = MediaQuery.of(context);
    width = data.size.width;
    height = data.size.height;
    widthBlock = width / 100;
    heightBlock = height / 100;
  }
}
