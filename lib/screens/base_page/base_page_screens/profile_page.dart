import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_flutter/config/export_config.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();

  XFile? pickedFile;

  Future<void> pickImage() async {
    print('Befroe setState');
    print(pickedFile?.path);

    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        pickedFile = pickedImage;
      });
    }

    print('After setState');

    print(pickedFile?.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            if (pickedFile != null) ...[
              Center(
                child: ClipOval(
                  child: Image.file(
                    File(pickedFile!.path),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: ClipOval(
                          child: Image.asset(
                            AssetPath.eggSalad2,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 122.5,
                bottom: 7.5,
                child: InkWell(
                  onTap: () async {
                    await pickImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlack,
                        border: Border.all(color: AppColors.lightBlack)),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
            ] else ...[
              Center(
                child: ClipOval(
                  child: Image.asset(
                    AssetPath.eggSalad2,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 122.5,
                bottom: 7.5,
                child: InkWell(
                  onTap: () async {
                    await pickImage();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightBlack,
                        border: Border.all(color: AppColors.lightBlack)),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.white,
                      size: 18,
                    ),
                  ),
                ),
              )
            ],
          ],
        )
      ],
    ));
  }
}
