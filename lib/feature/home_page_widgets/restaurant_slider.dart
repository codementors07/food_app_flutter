import 'package:flutter/material.dart';
import 'package:food_flutter/component/export_component.dart';

import '../../config/export_config.dart';

class RestaurantSlider extends StatelessWidget {
  RestaurantSlider({super.key});

  List<String> restaurantLogos = [
    AssetPath.burgerKing, //0
    AssetPath.mcdonald, //1
    AssetPath.subway, //2
    AssetPath.restaurant, //3
    AssetPath.domino, //4
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTitle(title: 'Restaurants'.toUpperCase()),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(restaurantLogos.length, (index) {
                // var isLastValue = index == restaurantLogos.length - 1;
                var isLastData = index == restaurantLogos.length - 1;
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 0, isLastData ? 20 : 0, 30),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 30,
                            color: Color.fromRGBO(0, 0, 0, 0.1)),
                      ]),
                  child: Image.asset(restaurantLogos[index]),
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
