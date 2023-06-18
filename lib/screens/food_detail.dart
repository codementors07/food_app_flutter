import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:food_flutter/feature/export_feature.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';

import '../component/export_component.dart';
import '../config/export_config.dart';
import '../controller/export_controller.dart';
import '../model/export_model.dart';
import 'export_screens.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key, required this.foodModel});

  static const String id = 'foodDetailId';

  final FoodModel foodModel;

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  void initState() {
    super.initState();
    Provider.of<FoodDetailProvider>(context, listen: false).quantity =
        widget.foodModel.quantity;
  }

  @override
  Widget build(BuildContext context) {
    //initialized provider in this page only .

    return Consumer2<FoodDetailProvider, CartAndFavProvider>(
        builder: (context, detailProv, cartProv, child) {
      return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: CustomButton(
              onPress: () {
                cartProv.addToCart(widget.foodModel);
                ScaffoldMessenger.of(context)
                    .showSnackBar(FoodGridvieWidget.createSnackBar(
                        content: 'Added to cart',
                        backgroundColor: AppColors.primaryColor,
                        label: 'Go to Cart',
                        onPress: () {
                          detailProv.changeNavBarPage(3).then((value) =>
                              pushNewScreen(context,
                                  screen: const BasePage(), withNavBar: false));
                        }));
              },
              btnText: 'Add to basket'.toUpperCase(),
              color: AppColors.lightPrimaryColor,
            ),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            carouselSlider(detailProv),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food details
                  FoodDetailsHeader(foodModel: widget.foodModel),

                  //quantity and price
                  quantityAndPrice(detailProv, context)
                ],
              ),
            ),
          ]));
    });
  }

  Widget carouselSlider(FoodDetailProvider detailProv) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: widget.foodModel.foodImage.length,
          itemBuilder: (context, index, i) {
            return Image.asset(
              widget.foodModel.foodImage[index],
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            );
          },
          options: CarouselOptions(
              aspectRatio: 1.25,
              initialPage: detailProv.carouselIndex,
              onPageChanged: (value, reason) {
                detailProv.changeCarouselIndex(value);
              },
              viewportFraction: 1.1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              reverse: false),
        ),
        Positioned(
          bottom: 25,
          child: CarouselIndicator(
            count: widget.foodModel.foodImage.length,
            index: detailProv.carouselIndex,
            activeColor: AppColors.primaryColor,
            color: AppColors.white,
            height: 4,
            width: 20,
            cornerRadius: 2,
          ),
        )
      ],
    );
  }

  Widget quantityAndPrice(FoodDetailProvider detailProv, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quantity'.toUpperCase(),
              style: CustomStyles.customTextStyle(
                  fontSize: 12,
                  fontColor: AppColors.primaryColor,
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.25,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.lightGray,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    detailProv.quantity.toString(),
                    style: CustomStyles.customTextStyle(
                        fontSize: 14,
                        fontColor: AppColors.lightBlack,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (detailProv.quantity > 1) {
                            detailProv.decreaseQuantity();
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      InkWell(
                          onTap: () {
                            detailProv.increaseQuantity();
                          },
                          child: const Icon(Icons.add,
                              color: AppColors.primaryColor))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Subtotal'.toUpperCase(),
              style: CustomStyles.customTextStyle(
                  fontSize: 12,
                  fontColor: AppColors.lightBlack,
                  // fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Rs ${widget.foodModel.discountedPrice}',
              style: CustomStyles.customTextStyle(
                  fontSize: 24,
                  fontColor: AppColors.lightPrimaryColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
