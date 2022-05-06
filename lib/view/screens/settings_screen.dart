import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/settings/dark_mode_widget.dart';
import 'package:eshop_spot/view/widgets/settings/language_widget.dart';
import 'package:eshop_spot/view/widgets/settings/logout_widget.dart';
import 'package:eshop_spot/view/widgets/settings/profile_image_widget.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImageWidget(),
          const SizedBox(height: 10),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          TextUtils(
            text: 'General'.tr,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? pinkColor : mainColor,
          ),
          const SizedBox(height: 20),
          DarkModeWidget(),
          const SizedBox(height: 20),
          LanguageWidget(),
          const SizedBox(height: 20),
          LogoutWidget(),
        ],
      ),
    );
  }
}
