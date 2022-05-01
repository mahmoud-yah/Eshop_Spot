import 'package:badges/badges.dart';
import 'package:eshop_spot/logic/controllers/cart_controller.dart';
import 'package:eshop_spot/logic/controllers/main_controller.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              actions: [
                Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.productsMap.values.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),

                // IconButton(
                //   onPressed: () {
                //     Get.toNamed(Routes.cartScreen);
                //   },
                //   icon: Image.asset('assets/images/shop.png'),
                // ),
              ],
              title: Text(
                controller.titles[controller.currentIndex.value],
              ),
              centerTitle: true,
              backgroundColor: context.theme.primaryColor,
              elevation: 0,
            ),
            backgroundColor: context.theme.backgroundColor,
            // backgroundColor: Colors.pink,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              backgroundColor: context.theme.backgroundColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  label: '',
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
