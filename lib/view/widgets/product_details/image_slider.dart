import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_spot/logic/controllers/cart_controller.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/product_details/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;

  const ImageSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  int currentImageIndex = 0;
  int currentColor = 0;
  final List<Color> selectedColor = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
  ];
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              //TODO Check this later

              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentImageIndex = index;
                });
              }),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentImageIndex,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? pinkColor : mainColor,
              dotColor: Colors.black,
            ),
            count: 3,
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentColor = index;
                      });
                    },
                    child: ColorPicker(
                      outerBorder: currentColor == index,
                      color: selectedColor[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 3),
                itemCount: selectedColor.length),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkColor.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  cartController.productsMap.values.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.cartScreen),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkColor.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
