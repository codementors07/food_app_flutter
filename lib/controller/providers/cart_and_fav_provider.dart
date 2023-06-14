import 'package:flutter/material.dart';

import '../../model/export_model.dart';

class CartAndFavProvider extends ChangeNotifier {
  List<int> isFav = [];

  List<FoodModel> favoriteList = [];

  bool containsData(int newValue) {
    return isFav.contains(newValue);
  }

  toggleFavorite(int newValue, FoodModel model) {
    if (!containsData(newValue)) {
      isFav.add(newValue);
      addToFavorite(model);
    } else {
      isFav.remove(newValue);
      removeFavorite(model);
    }
    notifyListeners();
  }

  Future<bool> addToFavorite(FoodModel model) {
    favoriteList.add(model);
    notifyListeners();

    return Future.value(true);
  }

  removeFavorite(FoodModel model) {
    favoriteList.remove(model);
    notifyListeners();
  }
}
