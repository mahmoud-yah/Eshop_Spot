import 'package:eshop_spot/logic/controllers/category_controller.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryItems(controller.categoryNamesList[index]);
                    Get.to(CategoryItems(categoryTitle: controller.categoryNamesList[index],));
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.categoryImages[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          controller.categoryNamesList[index],
                          style: const TextStyle(
                            backgroundColor: Colors.black38,
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: controller.categoryNamesList.length,
            ),
          );
        }
      },
    );
  }
}
