import 'package:eshop_spot/models/product_model.dart';
import 'package:eshop_spot/view/widgets/cart/add_cart.dart';
import 'package:eshop_spot/view/widgets/product_details/clothes_info.dart';
import 'package:eshop_spot/view/widgets/product_details/size_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_details/image_slider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl: productModel.image),
              ClothesInfo(
                title: productModel.title,
                productId: productModel.id,
                rate: productModel.rating.rate,
                description: productModel.description,
              ),
              const SizeList(),
              AddCart(productModel: productModel,),
            ],
          ),
        ),
      ),
    );
  }
}
