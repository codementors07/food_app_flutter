import 'package:flutter/material.dart';

import '../config/export_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onPress,
      required this.btnText,
      this.color,
      this.showBorder = false})
      : super(key: key);

  final Function()? onPress;
  final String btnText;
  final bool showBorder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color ??
                    (showBorder ? AppColors.white : AppColors.primaryColor),
                shape: RoundedRectangleBorder(
                    side: showBorder
                        ? const BorderSide(
                            color: AppColors.primaryColor, width: 1)
                        : BorderSide.none,
                    borderRadius: BorderRadius.circular(40))),
            onPressed: () {
              onPress?.call();
            },
            child: Text(
              btnText,
              style: CustomStyles.customTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontColor:
                      showBorder ? AppColors.primaryColor : AppColors.white),
            )));
  }
}
