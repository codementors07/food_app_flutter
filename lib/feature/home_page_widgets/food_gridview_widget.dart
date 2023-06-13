import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_flutter/component/export_component.dart';
import 'package:food_flutter/controller/export_controller.dart';
import 'package:food_flutter/screens/export_screens.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../../config/export_config.dart';
import '../../model/export_model.dart';

class FoodGridvieWidget extends StatelessWidget {
  const FoodGridvieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartAndFavProvider>(builder: (context, favProv, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(title: 'Recommended for you'.toUpperCase()),
          GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              shrinkWrap: true,
              primary: false,
              itemCount: foodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 21,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 250),
              itemBuilder: (context, index) {
                final foodDatas = foodList[index];

                return InkWell(
                  onTap: () {
                    // Navigator.pushNamed(context, FoodDetail.id);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => const FoodDetail()));

                    pushNewScreen(context,
                        screen: FoodDetail(
                          foodModel: foodDatas,
                        ),
                        withNavBar: false);
                  },
                  child: Container(
                    // width: MediaQuery.of(context).size.width / 2.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.15)),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.asset(
                                foodDatas.foodImage.first,
                                height: 157,
                                width: 157,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: InkWell(
                                  onTap: () {
                                    favProv.toggleFavorite(foodDatas.id);
                                    print(favProv.isFav);
                                  },
                                  child: ContainerIcon(
                                      color: AppColors.gray.withOpacity(0.65),
                                      icon: favProv.containsData(foodDatas.id)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      iconColor:
                                          favProv.containsData(foodDatas.id)
                                              ? Colors.red
                                              : AppColors.white)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodDatas.foodName,
                                style: CustomStyles.customTextStyle(
                                    fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        'Rs. ${foodDatas.mainPrice}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.gray,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Rs. ${foodDatas.discountedPrice}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: AppColors.primaryColor,
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7.5, horizontal: 2.5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: AppColors.lightPrimaryColor,
                                      ),
                                      child: SvgPicture.asset(
                                        AssetPath.cart,
                                        color: AppColors.white,
                                      )),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      );
    });
  }
}
