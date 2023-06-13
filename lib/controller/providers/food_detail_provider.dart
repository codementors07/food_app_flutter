import 'package:flutter/material.dart';

//provider ko class ma setState ko kaam garchau and then we will consume it to UI.
//initialize garnu parcha Change Notifier Provider le
//UI ma consue garnu parcha
//BLOC - Business Logic Consumer

class FoodDetailProvider extends ChangeNotifier {
  int carouselIndex = 0;
  int quantity = 1;
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
}
