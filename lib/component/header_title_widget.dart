import 'package:flutter/material.dart';

import '../config/export_config.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key, required this.title, this.showPadding = true});

  final String title;
  final bool showPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: showPadding
            ? const EdgeInsets.only(left: 20.0, bottom: 20)
            : EdgeInsets.zero,
        child: Text(
          title,
          style: CustomStyles.customTextStyle(
              fontSize: 14,
              fontColor: AppColors.lightBlack,
              fontWeight: FontWeight.w400),
        ));
  }
}
