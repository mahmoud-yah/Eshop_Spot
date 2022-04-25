import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Image.asset('assets/images/check.png')
                        : const Icon(
                            Icons.done,
                            color: pinkColor,
                            size: 30,
                          )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                TextUtils(
                  text: 'I accept ',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                TextUtils(
                  text: 'terms & conditions',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  underline: TextDecoration.underline,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
