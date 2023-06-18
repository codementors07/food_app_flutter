import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_flutter/controller/export_controller.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../config/export_config.dart';
import '../export_screens.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  static const String id = 'basePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FoodDetailProvider>(builder: (context, baseProv, child) {
        return PersistentTabView(
          context,
          controller: baseProv.persitentTabController,
          onItemSelected: (value) {
            baseProv.changeNavBarPage(value);
          },
          screens: [
            const HomePage(),
            const SearchPage(),
            const FavPage(),
            const CartPage(),
            ProfilePage()
          ],
          navBarStyle: NavBarStyle.style5,
          items: [
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                AssetPath.home,
                color: baseProv.navBarIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              activeColorPrimary: AppColors.primaryColor,
            ),
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                AssetPath.search,
                color: baseProv.navBarIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              activeColorPrimary: AppColors.primaryColor,
            ),
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                AssetPath.fav,
                color: baseProv.navBarIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              activeColorPrimary: AppColors.primaryColor,
            ),
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                AssetPath.cart,
                color: baseProv.navBarIndex == 3
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              activeColorPrimary: AppColors.primaryColor,
            ),
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                AssetPath.profile,
                color: baseProv.navBarIndex == 4
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
              activeColorPrimary: AppColors.primaryColor,
            ),
          ],
        );
      }),
    );
  }
}
