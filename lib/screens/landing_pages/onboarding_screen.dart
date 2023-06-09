import 'package:flutter/material.dart';

import '../../feature/export_feature.dart';
import '../../model/export_model.dart';
import '../export_screens.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  static const String id = 'onboardingScreen';

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: pageController,
            itemCount: OnboardingModel.onBoardingList.length,
            itemBuilder: (context, index) {
              return OnboardingWidget(
                onboardingModel: OnboardingModel.onBoardingList[index],
                onPress: () {
                  // if (index == 0) {
                  //   pageController.animateToPage(index + 1,
                  //       duration: const Duration(seconds: 2),
                  //       curve: Curves.decelerate);
                  // } else if (index == 1) {
                  //   pageController.animateToPage(index + 1,
                  //       duration: const Duration(seconds: 2),
                  //       curve: Curves.decelerate);
                  // } else {
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, BasePage.id, (route) => false);
                  // }

                  switch (index) {
                    case 0:
                      pageController.animateToPage(index + 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                      break;
                    case 1:
                      pageController.animateToPage(index + 2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                      break;

                    default:
                      Navigator.pushNamedAndRemoveUntil(
                          context, GetStartedScreen.id, (route) => false);
                  }
                },
              );
            }));
  }
}
