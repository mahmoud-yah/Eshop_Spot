import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:eshop_spot/logic/controllers/settings_controller.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print(authController.displayUsername);
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        authController.displayUserImage.value,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller
                        .capitalize(authController.displayUsername.value),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    text: authController.displayUserEmail.value,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
