import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productsList = <ProductModel>[].obs;
  var favoritesList = <ProductModel>[].obs;
  var isLoading = true.obs;
  String key = 'isFavorite';
  var storage = GetStorage();

  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedFavorites = storage.read<List>(key);
    if (storedFavorites != null) {
      favoritesList =
          storedFavorites.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductService.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic for favorites screen

  Future<void> toggleFavorites(int productId) async {
    int index = favoritesList.indexWhere((element) => element.id == productId);

    if (index >= 0) {
      favoritesList.removeAt(index);
      await storage.remove(key);
      await storage.write(key, favoritesList);
    } else {
      favoritesList
          .add(productsList.firstWhere((element) => element.id == productId));
      await storage.write(key, favoritesList);
    }
  }

  bool isFavorite(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String productName) {
    String productNameToLower = productName.toLowerCase();
    searchList.value = productsList.where((product) {
      return product.title.toLowerCase().contains(productNameToLower) ||
          product.price.toString().toLowerCase().contains(productNameToLower);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList('');
  }
}
