import 'package:flutter/material.dart';

class CartAndFavProvider extends ChangeNotifier {
  List<int> isFav = [];

  bool containsData(int newValue) {
    return isFav.contains(newValue);
  }

  toggleFavorite(int newValue) {
    if (!containsData(newValue)) {
      isFav.add(newValue);
    } else {
      isFav.remove(newValue);
    }
    notifyListeners();
  }
}
