import 'package:flutter/material.dart';
import 'package:food_flutter/component/export_component.dart';

import '../../../config/export_config.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Liked'.toUpperCase(),
                  style: CustomStyles.customTextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      fontColor: AppColors.lightBlack),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // height: 150,
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
                              AssetPath.eggSalad1,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            // mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Egg Salad',
                                style: CustomStyles.customTextStyle(
                                    fontFamily: 'Poppins'),
                              ),
                              // const Spacer(),
                              const SizedBox(
                                height: 20,
                              ),

                              Text(
                                'Rs. 500',
                                style: CustomStyles.customTextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontColor: AppColors.lightPrimaryColor),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContainerIcon(
                              color: AppColors.red,
                              icon: Icons.delete_forever_outlined,
                              iconColor: AppColors.white),
                          SizedBox(
                            height: 20,
                          ),
                          ContainerIcon(
                              color: AppColors.primaryColor,
                              icon: Icons.shopping_cart_outlined,
                              iconColor: AppColors.white),
                        ],
                      )
                    ],
                  ),
                ),
                const Text('data')
              ],
            ),
          ),
        ));
  }
}
