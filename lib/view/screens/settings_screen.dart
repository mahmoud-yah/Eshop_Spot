import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:eshop_spot/logic/controllers/theme_controller.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text(
                'Dark Mode',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (ctrl) {
                return TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Log Out',
                      titleStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      middleText: 'Are you sure you need to logout?',
                      middleTextStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.grey,
                      radius: 10,
                      textCancel: 'No',
                      cancelTextColor: Colors.white,
                      textConfirm: 'Yes',
                      confirmTextColor: Colors.white,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () {
                        ctrl.signOutFromApp();
                      },
                      buttonColor: Get.isDarkMode ? pinkColor : mainColor,
                    );
                    // ctrl.signOutFromApp();
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
