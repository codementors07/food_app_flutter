import 'package:flutter/material.dart';

import '../config/export_config.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.color,
    this.fontSize,
  });

  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'Food-'.toUpperCase(),
          style: CustomStyles.customTextStyle(
              fontSize: fontSize ?? 36,
              fontColor: color ?? AppColors.lightBlack,
              fontWeight: FontWeight.w400)),
      TextSpan(
          text: 'E'.toUpperCase(),
          style: CustomStyles.customTextStyle(
              fontSize: fontSize ?? 36,
              fontColor: AppColors.primaryColor,
              fontWeight: FontWeight.w400))
    ]));
  }
}
