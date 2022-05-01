import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/home/card_items.dart';
import 'package:eshop_spot/view/widgets/home/search_text_form.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                // color: Get.isDarkMode?pinkColor: mainColor,
                color: context.theme.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextUtils(
                      text: 'Find Your',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextUtils(
                      text: 'INSPIRATION',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: 'Categorise',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
