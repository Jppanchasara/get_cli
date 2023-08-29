// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechTotextController extends GetxController {
  var isListening = false.obs;
  var speechText = 'press the Mic button and start speaking'.obs;
  late SpeechToText speechToText;

  @override
  void onInit() {
    super.onInit();
    speechToText = SpeechToText();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void listen() async {
    if (!isListening.value) {
      bool available =
          await speechToText.initialize(onStatus: (val) {}, onError: (val) {});
      if (available) {
        isListening.value = true;
        speechToText.listen(onResult: (val) {
          speechText.value = val.recognizedWords;
        });
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      speechText.value = "";
    }
  }
}
