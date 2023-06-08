import 'package:flutter/material.dart';

import 'custom_colors.dart';

class CustomStyles {
  static TextStyle customTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? fontColor,
      String? fontFamily}) {
    return TextStyle(
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: fontColor ?? AppColors.black,
      fontFamily: fontFamily ?? 'BebasNeue',
    );
  }
}
