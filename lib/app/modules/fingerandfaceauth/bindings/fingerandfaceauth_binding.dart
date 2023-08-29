import 'package:get/get.dart';

import '../controllers/fingerandfaceauth_controller.dart';

class FingerandfaceauthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FingerandfaceauthController>(
      () => FingerandfaceauthController(),
    );
  }
}
