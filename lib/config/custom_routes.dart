import 'package:flutter/material.dart';

import '../screens/export_screens.dart';

class AppRpute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //BASE PAGE AND ITS SCREENS//
      case BasePage.id:
        return MaterialPageRoute(builder: (_) => const BasePage());

      case HomePage.id:
        return MaterialPageRoute(builder: (_) => const HomePage());

      ///LANDING PAGES///
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case OnboardingScreen.id:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case GetStartedScreen.id:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());

      //END//

      // case FoodDetail.id:
      //   return MaterialPageRoute(builder: (_) => const FoodDetail());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Not Found'),
                  ),
                ));
    }
  }
}
