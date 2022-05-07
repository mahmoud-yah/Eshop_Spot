import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:eshop_spot/logic/controllers/payment_controller.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  int radioContainerIndex = 1;
  bool changeColor = false;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            address: 'Mazzeh-Damascus,Syria',
            name: 'eshop spot shop',
            phone: '995585465',
            title: 'Eshop Spot',
            value: 1,
            color: changeColor ? Colors.white : Colors.grey.shade300,
            icon: const SizedBox(),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        const SizedBox(height: 10),
        Obx(
          () {
            return buildRadioContainer(
                address: controller.address.value,
                name: authController.displayUsername.value,
                phone: controller.phoneNumber.value,
                title: 'Delivery',
                value: 2,
                color: changeColor ? Colors.grey.shade300 : Colors.white,
                icon: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Enter your phone number',
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      radius: 10,
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.black,
                      textConfirm: 'Save',
                      cancelTextColor: Colors.black,
                      onCancel: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      onConfirm: () {
                        Get.back();
                        controller.phoneNumber.value = phoneController.text;
                      },
                      buttonColor: context.theme.primaryColor,
                      content: Padding(
                        padding: EdgeInsets.all(15),
                        child: TextField(
                          controller: phoneController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          maxLength: 11,
                          keyboardType: TextInputType.phone,
                          onSubmitted: (value) {
                            phoneController.text = value;
                          },
                          decoration: InputDecoration(
                            fillColor:
                                context.theme.primaryColor.withOpacity(0.15),
                            focusColor: Colors.red,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: context.theme.primaryColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                phoneController.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            hintText: 'Enter your phone number',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.contact_phone,
                    size: 20,
                    color: Get.isDarkMode ? pinkColor : mainColor,
                  ),
                ),
                onChanged: (int? value) {
                  setState(() {
                    radioContainerIndex = value!;
                    changeColor = !changeColor;
                  });
                  controller.updatePosition();
                });
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Text('+20 '),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 120),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
