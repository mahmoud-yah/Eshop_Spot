import 'package:eshop_spot/utils/my_string.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/auth/auth_button.dart';
import 'package:eshop_spot/view/widgets/auth/auth_text_forn_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'If you want to recover your account, then please provide your email below..',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(height: 50),
                  AuthTextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value)) {
                        return 'Email is not valid!';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Image.asset('assets/images/email.png')
                        : const Icon(
                            Icons.email,
                            color: pinkColor,
                            size: 30,
                          ),
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 50),
                  AuthButton(text: 'Send', onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
