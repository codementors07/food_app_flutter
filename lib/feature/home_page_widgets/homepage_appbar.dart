import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/export_config.dart';

class HomepageAppbar extends StatelessWidget {
  const HomepageAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Hello,',
                style: CustomStyles.customTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                    fontColor: AppColors.lightBlack)),
            const TextSpan(
              text: ' ',
            ),
            TextSpan(
                text: 'John',
                style: CustomStyles.customTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                    fontColor: AppColors.primaryColor)),
            TextSpan(
                text: '!',
                style: CustomStyles.customTextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Poppins',
                    fontColor: AppColors.lightBlack)),
          ])),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Home'.toUpperCase(),
                style: CustomStyles.customTextStyle(
                    fontSize: 12,
                    fontColor: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 7.75,
              ),
              SvgPicture.asset(AssetPath.pin),
            ],
          )
        ],
      ),
    );
  }
}
