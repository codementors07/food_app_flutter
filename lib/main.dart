import 'package:flutter/material.dart';
import 'package:food_flutter/config/custom_routes.dart';
import 'package:food_flutter/screens/landing_pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'BebasNeue',
      ),
      onGenerateRoute: AppRpute.onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
