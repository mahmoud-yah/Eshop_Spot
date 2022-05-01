import 'package:eshop_spot/logic/controllers/product_controller.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Obx(
                () {
                  return Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        controller.toggleFavorites(productId);
                      },
                      child: controller.isFavorite(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                  size: 20,
                ),
                itemCount: 5,
                itemSize: 20,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: ' Show More ',
            trimExpandedText: ' Show Less ',
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkColor : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 1.5,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
