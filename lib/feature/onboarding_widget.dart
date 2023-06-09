import 'package:flutter/material.dart';

import '../component/export_component.dart';
import '../config/export_config.dart';
import '../model/export_model.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingModel,
    this.onPress,
  });

  final OnboardingModel onboardingModel;

  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          onboardingModel.imageUrl,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/cook.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            );
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.5),
        ),
        const Positioned(
            top: 50,
            left: 20,
            child: LogoWidget(
              color: AppColors.white,
            )),
        Positioned(
          bottom: 185,
          left: 20,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: '${onboardingModel.header1}\n'.toUpperCase(),
                style: CustomStyles.customTextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColors.white)),
            TextSpan(
              text: onboardingModel.header2.toUpperCase(),
              style: CustomStyles.customTextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontColor: AppColors.white),
            ),
            TextSpan(
              text: onboardingModel.header3.toUpperCase(),
              style: CustomStyles.customTextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  fontColor: AppColors.primaryColor),
            ),
            TextSpan(
              text: onboardingModel.header4.toUpperCase(),
              style: CustomStyles.customTextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                fontColor: AppColors.white,
              ),
            ),
          ])),
        ),
        Positioned(
          left: 20,
          bottom: 140,
          right: 20,
          child: Text(
            onboardingModel.subHeader,
            style: CustomStyles.customTextStyle(
                fontColor: AppColors.white, fontFamily: 'Poppins'),
          ),
        ),
        Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: CustomButton(
              btnText: onboardingModel.btnText,
              onPress: onPress,
            ))
      ],
    );
  }
}
