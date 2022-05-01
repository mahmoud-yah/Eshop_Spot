import 'package:eshop_spot/logic/controllers/cart_controller.dart';
import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard({
    Key? key,
    required this.productModel,
    required this.index,
  }) : super(key: key);

  final ProductModel productModel;
  final int index;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkColor.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(
              left: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  productModel.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '\$${controller.productsSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductFromCart(productModel);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    '${controller.productsMap.values.toList()[index]}',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      // color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProduct2Cart(productModel);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModel);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
