import 'package:eshop_spot/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(' ').map((name) => name.capitalize).join(' ');
  }

  @override
  void onInit() async {
    langLocal = await getLanguage;
    super.onInit();
  }

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String languageType) {
    saveLanguage(languageType);
    if (langLocal == languageType) {
      return;
    }
    if (languageType == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (languageType == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }

    update();
  }
}
