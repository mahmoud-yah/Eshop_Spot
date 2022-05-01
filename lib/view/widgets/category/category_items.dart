import 'package:eshop_spot/logic/controllers/cart_controller.dart';
import 'package:eshop_spot/logic/controllers/category_controller.dart';
import 'package:eshop_spot/logic/controllers/product_controller.dart';
import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/screens/product_details_screen.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;

  CategoryItems({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
        ),
        body: Obx(
          () {
            if (categoryController.isCategoryItemsLoading.value) {
              print(categoryController.isCategoryItemsLoading.value);
              return Center(
                child: CircularProgressIndicator(
                  color: Get.isDarkMode ? pinkColor : mainColor,
                ),
              );
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6,
                  maxCrossAxisExtent: 200,
                ),
                itemCount: categoryController.categoryItemsList.length,
                itemBuilder: (context, index) {
                  return BuildCardItems(
                    // image: controller.productsList[index].image,
                    // price: controller.productsList[index].price,
                    // rate: controller.productsList[index].rating.rate,
                    // productId: controller.productsList[index].id,
                    productModel: categoryController.categoryItemsList[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            productModel:
                                categoryController.categoryItemsList[index],
                          ));
                    },
                  );
                },
              );
            }
          },
        ));
  }

  Widget BuildCardItems({
    // required String image,
    // required double price,
    // required double rate,
    // required int productId,
    required ProductModel productModel,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.toggleFavorites(productModel.id);
                      },
                      icon: controller.isFavorite(productModel.id)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProduct2Cart(productModel);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  productModel.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${productModel.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '${productModel.rating.rate}',
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
