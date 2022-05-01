import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProduct2Cart(ProductModel productModel) {
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
    } else {
      productsMap[productModel] = 1;
    }
  }

  void removeProductFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: 'Empty the cart',
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you want to empty your cart?',
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
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkColor : mainColor,
    );
  }

  get productsSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
// var total;
}
