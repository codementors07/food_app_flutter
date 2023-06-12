import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../config/export_config.dart';
import 'base_page_screens/cart_page.dart';
import 'base_page_screens/fav_page.dart';
import 'base_page_screens/home_page.dart';
import 'base_page_screens/profile_page.dart';
import 'base_page_screens/search_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  static const String id = 'basePage';

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int initialIndex = 0;

  PersistentTabController persitentTabController = PersistentTabController();

  @override
  void initState() {
    super.initState();
    persitentTabController =
        PersistentTabController(initialIndex: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: persitentTabController,
        onItemSelected: (value) {
          setState(() {
            initialIndex = value;
          });
        },
        screens: [
          HomePage(),
          const SearchPage(),
          const FavPage(),
          const CartPage(),
          const ProfilePage()
        ],
        navBarStyle: NavBarStyle.style5,
        items: [
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              AssetPath.home,
              color:
                  initialIndex == 0 ? AppColors.primaryColor : AppColors.black,
            ),
            activeColorPrimary: AppColors.primaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              AssetPath.search,
              color:
                  initialIndex == 1 ? AppColors.primaryColor : AppColors.black,
            ),
            activeColorPrimary: AppColors.primaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              AssetPath.fav,
              color:
                  initialIndex == 2 ? AppColors.primaryColor : AppColors.black,
            ),
            activeColorPrimary: AppColors.primaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              AssetPath.cart,
              color:
                  initialIndex == 3 ? AppColors.primaryColor : AppColors.black,
            ),
            activeColorPrimary: AppColors.primaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              AssetPath.profile,
              color:
                  initialIndex == 4 ? AppColors.primaryColor : AppColors.black,
            ),
            activeColorPrimary: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
