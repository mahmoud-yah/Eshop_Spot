import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isCheckBox = false;

  var displayUsername = '';

  FirebaseAuth auth = FirebaseAuth.instance;

  void visibilty() {
    isVisible = !isVisible;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  Future<void> signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUsername = name;
        auth.currentUser!.updateDisplayName(displayUsername);
      });

      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUsername = auth.currentUser!.displayName!);

      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpApp() {}

  void facebookSignUpApp() {}

  void resetPassword() {}

  void signOutFromApp() {}
}
