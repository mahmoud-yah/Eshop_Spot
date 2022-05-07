import 'package:eshop_spot/logic/controllers/main_controller.dart';
import 'package:eshop_spot/logic/controllers/payment_controller.dart';
import 'package:eshop_spot/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController());
  }
}
