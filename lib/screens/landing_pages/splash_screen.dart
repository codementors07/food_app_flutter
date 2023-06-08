import 'package:flutter/material.dart';

import '../../component/loggo_widget.dart';
import '../../config/custom_colors.dart';
import '../../config/custom_styles.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String id = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init(context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      return Navigator.pushNamedAndRemoveUntil(
          context, OnboardingScreen.id, (route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const Center(
            child: LogoWidget(),
          ),

          Positioned(
            bottom: 42,
            child: Text(
              'rkfd'.toUpperCase(),
              style: CustomStyles.customTextStyle(
                  fontColor: AppColors.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          )
          // const Spacer(),
        ],
      ),
    );
  }
}
