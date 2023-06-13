import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:food_flutter/feature/export_feature.dart';

import '../component/export_component.dart';
import '../config/export_config.dart';
import '../model/export_model.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key, required this.foodModel});

  static const String id = 'foodDetailId';

  final FoodModel foodModel;

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: CustomButton(
          btnText: 'Add to basket'.toUpperCase(),
          color: AppColors.lightPrimaryColor,
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        carouselSlider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //food details
              FoodDetailsHeader(foodModel: widget.foodModel),

              Row(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.lightGray,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.foodModel.quanitiy.toString(),
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
                                    setState(() {
                                      if (widget.foodModel.quanitiy > 1) {
                                        widget.foodModel.quanitiy--;
                                      }
                                    });
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
                                      setState(() {
                                        widget.foodModel.quanitiy++;
                                      });
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
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget carouselSlider() {
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
              initialPage: carouselIndex,
              onPageChanged: (value, reason) {
                setState(() {
                  carouselIndex = value;
                });
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
            index: carouselIndex,
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
}
