import 'package:flutter/material.dart';

import '../../config/export_config.dart';

class HomepageAdWidget extends StatelessWidget {
  const HomepageAdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightPrimaryColor,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    color: Color.fromRGBO(0, 0, 0, 0.15))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'get '.toUpperCase(),
                  style: CustomStyles.customTextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.white),
                ),
                TextSpan(
                  text: '50% '.toUpperCase(),
                  style: CustomStyles.customTextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.black),
                ),
                TextSpan(
                  text: 'as a joining bonus'.toUpperCase(),
                  style: CustomStyles.customTextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.white),
                ),
              ])),
              const SizedBox(
                height: 20,
              ),
              Text(
                'use code on checkout'.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                'new50'.toUpperCase(),
                style: CustomStyles.customTextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColors.lightBlack),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 10,
          child: Image.asset(
            AssetPath.handImage,
          ),
        )
      ],
    );
  }
}
