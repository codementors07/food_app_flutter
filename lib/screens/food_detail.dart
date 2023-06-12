import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/component/export_component.dart';
import 'package:intl/intl.dart';

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
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        carouselSlider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.foodModel.foodName,
                    style: CustomStyles.customTextStyle(
                        fontWeight: FontWeight.w400,
                        fontColor: AppColors.lightBlack,
                        fontSize: 36),
                  ),
                  const Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.secondaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'The Nautilus',
                    style: CustomStyles.customTextStyle(
                        fontWeight: FontWeight.w500,
                        fontColor: AppColors.secondaryColor,
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    '${DateFormat('mm').format(widget.foodModel.deliveryTime)} mins',
                    style: CustomStyles.customTextStyle(
                        fontWeight: FontWeight.w500,
                        fontColor: AppColors.secondaryColor,
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              HeaderTitle(
                title: 'Description'.toUpperCase(),
                showPadding: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.foodModel.foodDescription,
                style: CustomStyles.customTextStyle(
                    fontSize: 14,
                    fontColor: AppColors.gray,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 40, width: 0),
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
                        padding: const EdgeInsets.all(20),
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
                            const Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: AppColors.primaryColor,
                                ),
                                SizedBox(
                                  width: 9,
                                ),
                                Icon(Icons.add, color: AppColors.primaryColor)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtotal'.toUpperCase(),
                        style: CustomStyles.customTextStyle(
                            fontSize: 12,
                            fontColor: AppColors.lightBlack,
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              )
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
