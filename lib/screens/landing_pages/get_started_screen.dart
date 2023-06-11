import 'package:flutter/material.dart';
import 'package:food_flutter/screens/export_screens.dart';

import '../../component/export_component.dart';
import '../../config/export_config.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  static const String id = 'getStartedScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoWidget(
                fontSize: 20,
              ),
              const SizedBox(
                height: 50,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Get'.toUpperCase(),
                    style: CustomStyles.customTextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.lightBlack)),
                const TextSpan(text: '  '),
                TextSpan(
                    text: 'Started'.toUpperCase(),
                    style: CustomStyles.customTextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.primaryColor))
              ])),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Get started and enjoy the awesome local food right at your home.',
                style: CustomStyles.customTextStyle(
                    fontFamily: 'Poppins', fontColor: AppColors.lightBlack),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        onPress: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, BasePage.id, (route) => false);
                        },
                        btnText: 'Login'.toUpperCase()),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      btnText: 'Register'.toUpperCase(),
                      showBorder: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
