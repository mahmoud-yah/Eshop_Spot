import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function() onPressed;

  const BottomContainer({required this.text,required this.buttonText, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Get.isDarkMode? mainColor:pinkColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              text: buttonText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
