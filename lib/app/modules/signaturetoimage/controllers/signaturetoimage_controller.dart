

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SignaturetoimageController extends GetxController {
  //TODO: Implement SignaturetoimageController
  late SignatureController signatureController;
  var padColor = Colors.black.obs;
  var penColor = Colors.white.obs;

  @override
  void onInit() {
    super.onInit();
    initializedSignatureimageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    signatureController.dispose();
  }

  void initializedSignatureimageController() {
    signatureController =
        SignatureController(penColor: penColor.value, penStrokeWidth: 5);
  }

  void selectPadColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: padColor.value,
          onColorChanged: (Color) {
            padColor.value = Color;
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void selectPenColor() {
    Get.dialog(Center(
      child: Dialog(
        child: ColorPicker(
          pickerColor: penColor.value,
          onColorChanged: (Color) {
            penColor.value = Color;
            initializedSignatureimageController();
          },
          showLabel: true,
          pickerAreaHeightPercent: .8,
        ),
      ),
    ));
  }

  void exportSignuture() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (signatureController.isNotEmpty) {
      final exportedSignature = SignatureController(
          penColor: penColor.value,
          penStrokeWidth: 5,
          exportBackgroundColor: padColor.value,
          points: signatureController.points);
      final Signature = await exportedSignature.toPngBytes();
      exportedSignature.dispose();
      final result = await ImageGallerySaver.saveImage(Signature!,
          name: "MySignature.png");
      final isExported = result['isSuccess'];
      if(isExported){
        Get.snackbar("Success", "Signauture Exported", backgroundColor: Colors.green,colorText: Colors.white);

      }else{
        Get.snackbar("Error", "Signauture Not Exported", backgroundColor: Colors.red,colorText: Colors.white);
      }
    } else {
      Get.snackbar("Error", "Provide Signauture", backgroundColor: Colors.red,colorText: Colors.white);
    }
  }
}
