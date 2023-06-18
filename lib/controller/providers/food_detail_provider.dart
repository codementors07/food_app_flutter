import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

//provider ko class ma setState ko kaam garchau and then we will consume it to UI.
//initialize garnu parcha Change Notifier Provider le
//UI ma consue garnu parcha
//BLOC - Business Logic Consumer

class FoodDetailProvider extends ChangeNotifier {
  FoodDetailProvider() {
    init();
  }

  int carouselIndex = 0;
  int quantity = 1;

  int navBarIndex = 0;

  PersistentTabController persitentTabController = PersistentTabController();

  Future<bool> changeNavBarPage(int newValue) {
    navBarIndex = newValue;

    persitentTabController.jumpToTab(newValue);
    notifyListeners();
    return Future.value(true);
  }

  changeCarouselIndex(int newValue) {
    carouselIndex = newValue;
    notifyListeners(); //setState ko kaam esle garcha
  }

  increaseQuantity() {
    quantity++;
    notifyListeners();
  }

  decreaseQuantity() {
    quantity--;
    notifyListeners();
  }

  init() {
    persitentTabController = PersistentTabController(initialIndex: navBarIndex);
  }
}
