import 'package:eshop_spot/view/screens/category_screen.dart';
import 'package:eshop_spot/view/screens/favorites_screen.dart';
import 'package:eshop_spot/view/screens/home_screen.dart';
import 'package:eshop_spot/view/screens/settings_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;

  final titles = [
    "Eshop Spot",
    "Categories",
    "Favorites",
    "Settings"
  ].obs;
}
