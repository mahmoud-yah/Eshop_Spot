

import 'package:eshop_spot/logic/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }

}