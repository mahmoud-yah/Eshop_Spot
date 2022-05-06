import 'package:eshop_spot/models/facebook_model.dart';
import 'package:eshop_spot/routes/routes.dart';
import 'package:eshop_spot/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisible = false;
  bool isCheckBox = false;

  var displayUsername = ''.obs;
  var displayUserImage = ''.obs;
  var displayUserEmail = ''.obs;
  var googleSignIn = GoogleSignIn();
  FacebookModel? facebookModel;

  FirebaseAuth auth = FirebaseAuth.instance;

  var isSignedIn = false;

  final GetStorage authBox = GetStorage();

  User? get currentUser => auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    displayUsername.value =
        (currentUser != null ? currentUser!.displayName : '')!;

    displayUserImage.value =
    (currentUser != null ? currentUser!.photoURL : '')!;

    displayUserEmail.value =
    (currentUser != null ? currentUser!.email : '')!;
  }

  void visibility() {
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
        displayUsername.value = name;
        auth.currentUser!.updateDisplayName(displayUsername.value);
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
          .then((value) =>
              displayUsername.value = auth.currentUser!.displayName!);

      isSignedIn = true;
      authBox.write('auth', isSignedIn);
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

  Future<void> googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUsername.value = googleUser!.displayName!;
      displayUserImage.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  Future<void> facebookSignUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      var data = await FacebookAuth.instance.getUserData();
      facebookModel = FacebookModel.fromJson(data);

      // print(facebookModel!.name);
      // print(facebookModel!.email);

      isSignedIn = true;
      authBox.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();

      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
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

  Future<void> signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUsername.value = '';
      displayUserImage.value = '';
      displayUserEmail.value = '';
      isSignedIn = false;
      authBox.remove('auth');
      update();

      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }
}
