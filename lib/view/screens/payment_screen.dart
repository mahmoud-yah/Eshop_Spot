import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/payment/delivery_container_widget.dart';
import 'package:eshop_spot/view/widgets/payment/payment_method_widget.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Payment',
        ),
        elevation: 0,
        backgroundColor: context.theme.primaryColor,
        // backgroundColor: Get.isDarkMode ? darkGreyColor : mainColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: 'Shipping to',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 20),
              DeliveryContainerWidget(),
              const SizedBox(height: 20),
              TextUtils(
                text: 'Payment method',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 20),
              PaymentMethodWidget(),
              const SizedBox(height: 30),
              // TotalButton(),
              Align(
                alignment: Alignment.center,
                child: TextUtils(
                  text: 'Total 200\$',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkColor : mainColor,
                    ),
                    onPressed: () {},
                    child: const Text('Pay now',style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
