import 'package:flutter/material.dart';
import '../../../feature/export_feature.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String id = 'homePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appbar for homepage
          const HomepageAppbar(),

          //ad banner widget
          const HomepageAdWidget(),

          //gridview food
          const FoodGridvieWidget(),

          //logo slider
          RestaurantSlider()
        ],
      ),
    ));
  }
}

//DefaultTabController , tabbar, tabbaview
//tabbar and tabbarview, initial index
//custom tabbar
