import 'package:eshop_spot/logic/bindings/auth_binding.dart';
import 'package:eshop_spot/view/screens/auth/forgot_password_screen.dart';
import 'package:eshop_spot/view/screens/auth/login_screen.dart';
import 'package:eshop_spot/view/screens/auth/signup_screen.dart';
import 'package:eshop_spot/view/screens/main_screen.dart';
import 'package:eshop_spot/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  //initalRoute
  static const welcome = Routes.welcomeScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: ()=> ForgotPassword(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.mainScreen,
      page: ()=> MainScreen(),
      binding: AuthBinding(),
    ),

  ];
}

class Routes{
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
}