import 'package:flutter/material.dart';

import '../screens/export_screens.dart';

class AppRpute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BasePage.id:
        return MaterialPageRoute(builder: (_) => const BasePage());

      ///LANDING PAGES///
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case OnboardingScreen.id:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

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
