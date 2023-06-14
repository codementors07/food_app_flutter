import 'package:flutter/material.dart';
import 'package:food_flutter/controller/export_controller.dart';
import 'package:provider/provider.dart';

import '../../../config/export_config.dart';
import '../../../feature/export_feature.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Consumer<CartAndFavProvider>(
                builder: (context, favProv, child) {
              return Column(
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
                  Expanded(
                    child: ListView.separated(
                        itemCount: favProv.favoriteList.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (context, index) {
                          var favDatas = favProv.favoriteList[index];
                          return FavoriteContainerWidget(
                            favDatas: favDatas,
                            favProv: favProv,
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
