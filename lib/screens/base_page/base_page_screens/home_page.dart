import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_flutter/config/export_config.dart';
import '../../../feature/export_feature.dart';
import '../../../model/export_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appbar for homepage
          const HomepageAppbar(),

          //ad banner widget
          const HomepageAdWidget(),

          //gridview food
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Recommended for you',
              style: CustomStyles.customTextStyle(
                  fontSize: 12,
                  fontColor: AppColors.lightBlack,
                  fontWeight: FontWeight.w400),
            ),
          ),

          GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
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

                return Container(
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
                            child: Container(
                              padding: const EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.gray.withOpacity(0.65),
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
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
                );
              })
        ],
      ),
    ));
  }
}

//DefaultTabController , tabbar, tabbaview
//tabbar and tabbarview, initial index
//custom tabbar
