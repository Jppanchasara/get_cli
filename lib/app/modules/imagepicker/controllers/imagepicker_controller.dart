// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_import

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagepickerController extends GetxController {
  //TODO: Implement ImagepickerController
  RxString imagepath = ''.obs;
  RxString imageGPath = ''.obs;
  Future getImagePicker() async {
    final ImagePicker _picket = ImagePicker();
    final image =
        await _picket.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (image != null) {
      imagepath.value = image.path.toString();
    }
  }

  Future setImagePicker() async {
    final ImagePicker _picket = ImagePicker();
    final image =
        await _picket.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image != null) {
      imageGPath.value = image.path.toString();
    }
  }


  @override
  void onInit() {
    super.onInit();
  
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
