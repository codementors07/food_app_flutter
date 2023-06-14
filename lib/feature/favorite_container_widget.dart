import 'package:flutter/material.dart';
import 'package:food_flutter/controller/providers/export_provider.dart';

import '../component/export_component.dart';
import '../config/export_config.dart';
import '../model/export_model.dart';

class FavoriteContainerWidget extends StatelessWidget {
  const FavoriteContainerWidget({
    super.key,
    required this.favDatas,
    required this.favProv,
  });

  final FoodModel favDatas;
  final CartAndFavProvider favProv;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      // margin: const EdgeInsets.symmetric(vertical: 7.5),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  favDatas.foodImage.last,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favDatas.foodName,
                    style: CustomStyles.customTextStyle(fontFamily: 'Poppins'),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    'Rs. ${favDatas.discountedPrice}',
                    style: CustomStyles.customTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.lightPrimaryColor),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  favProv.toggleFavorite(favDatas.id, favDatas);
                },
                child: const ContainerIcon(
                    color: AppColors.red,
                    icon: Icons.delete_forever_outlined,
                    iconColor: AppColors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const ContainerIcon(
                  color: AppColors.primaryColor,
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.white),
            ],
          )
        ],
      ),
    );
  }
}
