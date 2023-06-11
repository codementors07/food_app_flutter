import 'package:food_flutter/config/custom_assets.dart';

class FoodModel {
  final List<String> foodImage;
  final String foodName;
  final String foodDescription;
  final int mainPrice;
  final int discountedPrice;
  final int quanitiy;
  final DateTime deliveryTime;
  final double rating;

  FoodModel({
    required this.foodImage,
    required this.foodName,
    required this.foodDescription,
    required this.mainPrice,
    required this.discountedPrice,
    required this.quanitiy,
    required this.deliveryTime,
    required this.rating,
  });
}

List<FoodModel> foodList = [
  FoodModel(
      foodImage: [
        AssetPath.eggSalad1,
        AssetPath.eggSalad2,
        AssetPath.eggSalad3,
      ],
      foodName: 'Egg Salad',
      foodDescription:
          'This is egg salad and it is very very healthy for diet customers .',
      mainPrice: 550,
      discountedPrice: 450,
      quanitiy: 2,
      deliveryTime: DateTime(2023, 06, 11, 18, 20),
      rating: 3.5),
  FoodModel(
      foodImage: [
        AssetPath.salmon1,
        AssetPath.salmon2,
        AssetPath.salmon3,
      ],
      foodName: 'Grilled Salmon',
      foodDescription:
          'This is grilled salmon served with sinach and some greens to make you healthy and fall in love with sea.',
      mainPrice: 1250,
      discountedPrice: 920,
      quanitiy: 1,
      deliveryTime: DateTime(2023, 06, 12, 7, 56),
      rating: 4.5),
  FoodModel(
      foodImage: [
        AssetPath.momo1,
        AssetPath.momo2,
        AssetPath.momo3,
      ],
      foodName: 'Momos',
      foodDescription:
          'Serving different types of momo with beautiful presentation and deliciousness.',
      mainPrice: 350,
      discountedPrice: 300,
      quanitiy: 9,
      deliveryTime: DateTime(2023, 06, 13, 20, 24),
      rating: 5),
  FoodModel(
      foodImage: [
        AssetPath.pizza1,
        AssetPath.pizza2,
        AssetPath.pizza3,
      ],
      foodName: 'Pizza',
      foodDescription:
          'The best fast food with extra chessiness and crispy base for Pizza lovers around the world',
      mainPrice: 1450,
      discountedPrice: 1230,
      quanitiy: 4,
      deliveryTime: DateTime(2023, 06, 14, 19, 57),
      rating: 4),
];
