import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/my_string.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:eshop_spot/view/widgets/auth/auth_button.dart';
import 'package:eshop_spot/view/widgets/auth/auth_text_forn_field.dart';
import 'package:eshop_spot/view/widgets/auth/bottom_container.dart';
import 'package:eshop_spot/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyColor : Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkColor : mainColor,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),

                        // const SizedBox(
                        //   height: 20,
                        // ),
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
                              ? const Icon(
                                  Icons.email,
                                  color: pinkColor,
                                  size: 30,
                                )
                              : Image.asset('assets/images/email.png'),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer than 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? const Icon(
                                      Icons.lock,
                                      color: pinkColor,
                                      size: 30,
                                    )
                                  : Image.asset('assets/images/lock.png'),
                              hintText: 'Password',
                              obscureText: controller.isVisible ? false : true,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisible
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                            );
                          },
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forgot password?',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 50,
                        ),

                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            text: 'LOG IN',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.logInUsingFirebase(
                                  email: email,
                                  password: password,
                                );
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 20),
                        TextUtils(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (_) {
                              return InkWell(
                                onTap: () {
                                  controller.facebookSignUpApp();
                                },
                                child:
                                    Image.asset('assets/images/facebook.png'),
                              );
                            }),
                            const SizedBox(width: 10),
                            GetBuilder<AuthController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    controller.googleSignUpApp();
                                  },
                                  child:
                                      Image.asset('assets/images/google.png'),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
                text: 'Don\'t have an account? ',
                buttonText: 'Sign up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
