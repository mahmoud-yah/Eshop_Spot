import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNamesList = <String>[].obs;
  var isCategoryLoading = false.obs;
  var isCategoryItemsLoading = false.obs;

  var categoryItemsList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
  }

  var categoryImages = [
    'https://media-exp1.licdn.com/dms/image/C4E1BAQGpoD6OAi9CCA/company-background_10000/0/1550767306745?e=2147483647&v=beta&t=39eCNBskOTHD6p-WwGmiZHyx2Sav9htdtV9VA9FM8Zw',
    'https://www.istanbuljewelryshow.com/content/dam/Informa/istanbuljewelryshow2020/en/2020/images/ijs-blog/women-jewelry/daily-jewelry.png',
    'https://media.gq.com/photos/5ebd9e81dd0859a9f32ebff1/master/pass/051420_sales_refresh_3x2.jpg',
    'https://static.fibre2fashion.com/articleresources/images/22/2120/womens-clothing-todays-fashions.jpg',
  ].obs;

  void getCategory() async {
    var categoryName = await CategoryService.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNamesList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getCategoryItems(String categoryName) async {
    isCategoryItemsLoading(true);
    var categoryItems = await CategoryService.getCategoryItems(categoryName);
    try {
      // isCategoryItemsLoading(true);
      if (categoryName.isNotEmpty) {
        categoryItemsList.value = categoryItems;
      }
    } finally {
      isCategoryItemsLoading(false);
    }
  }
}
