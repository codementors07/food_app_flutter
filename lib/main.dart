import 'package:flutter/material.dart';
import 'package:food_flutter/config/custom_routes.dart';
import 'package:food_flutter/screens/export_screens.dart';
import 'package:provider/provider.dart';

import 'controller/providers/export_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodDetailProvider()),
        ChangeNotifierProvider(create: (_) => CartAndFavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'BebasNeue',
        ),
        onGenerateRoute: AppRpute.onGenerateRoute,
        home: const BasePage(),
      ),
    );
  }
}
