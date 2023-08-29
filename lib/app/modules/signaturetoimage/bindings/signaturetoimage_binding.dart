import 'package:get/get.dart';

import '../controllers/signaturetoimage_controller.dart';

class SignaturetoimageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignaturetoimageController>(
      () => SignaturetoimageController(),
    );
  }
}
