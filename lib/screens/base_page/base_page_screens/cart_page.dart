import 'package:flutter/material.dart';
import 'package:food_flutter/controller/providers/export_provider.dart';
import 'package:provider/provider.dart';

import '../../../component/export_component.dart';
import '../../../config/export_config.dart';
import '../../../feature/export_feature.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Consumer2<CartAndFavProvider, FoodDetailProvider>(
            builder: (context, cartProv, detailProv, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basket'.toUpperCase(),
                style: CustomStyles.customTextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    fontColor: AppColors.lightBlack),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: cartProv.cartList.length,
                    separatorBuilder: (context, index) {
                      return const Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: AppColors.lightGray,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    },
                    itemBuilder: (context, index) {
                      var cartDatas = cartProv.cartList[index];
                      return Container(
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
                                    cartDatas.foodImage.first,
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
                                      cartDatas.foodName,
                                      style: CustomStyles.customTextStyle(
                                          fontFamily: 'Poppins'),
                                    ),
                                    // const Spacer(),
                                    const SizedBox(
                                      height: 30,
                                    ),

                                    Text(
                                      'Rs.${cartDatas.discountedPrice}',
                                      style: CustomStyles.customTextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400,
                                          fontColor:
                                              AppColors.lightPrimaryColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // favProv.toggleFavorite(favDatas.id, favDatas);
                                    cartProv.removeCartData(index);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        FoodGridvieWidget.createSnackBar(
                                            content: 'Removed From Cart',
                                            backgroundColor: AppColors.red,
                                            label: '',
                                            backgroundColorForaction:
                                                AppColors.red,
                                            onPress: () {
                                              // baseProv.changeNavBarPage(3);
                                            }));
                                  },
                                  child: const ContainerIcon(
                                      color: AppColors.red,
                                      icon: Icons.delete_forever_outlined,
                                      iconColor: AppColors.white),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  '${cartDatas.quantity}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors.lightBlack,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
        }),
      ),
    ));
  }
}
