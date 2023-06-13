import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../component/export_component.dart';
import '../../config/export_config.dart';
import '../../model/export_model.dart';

class FoodDetailsHeader extends StatelessWidget {
  const FoodDetailsHeader({super.key, required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              foodModel.foodName,
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
              '${DateFormat('mm').format(foodModel.deliveryTime)} mins',
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
          foodModel.foodDescription,
          style: CustomStyles.customTextStyle(
              fontSize: 14,
              fontColor: AppColors.gray,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 40, width: 0),
      ],
    );
  }
}
