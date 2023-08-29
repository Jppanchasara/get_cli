import 'package:get/get.dart';

import '../controllers/speech_totext_controller.dart';

class SpeechTotextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeechTotextController>(
      () => SpeechTotextController(),
    );
  }
}
