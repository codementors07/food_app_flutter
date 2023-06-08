import 'package:flutter/material.dart';
import 'package:food_flutter/config/custom_colors.dart';
import 'package:food_flutter/config/custom_styles.dart';

import '../../component/loggo_widget.dart';
import '../base_page/base_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String id = 'onboardingScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1532635211-8ec15f2ce05c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
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
                    text: 'Awesome\n'.toUpperCase(),
                    style: CustomStyles.customTextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.white)),
                TextSpan(
                  text: 'Local'.toUpperCase(),
                  style: CustomStyles.customTextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.primaryColor),
                ),
                TextSpan(
                  text: 'Food'.toUpperCase(),
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
                'Discover delicious food from the amazing restaurants near you',
                style: CustomStyles.customTextStyle(
                    fontColor: AppColors.white, fontFamily: 'Poppins'),
              ),
            ),
            Positioned(
                bottom: 50,
                left: 20,
                right: 20,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, BasePage.id, (route) => false);
                        },
                        child: Text(
                          'Next',
                          style: CustomStyles.customTextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontColor: Colors.white),
                        ))))
          ],
        )
      ],
    ));
  }
}
