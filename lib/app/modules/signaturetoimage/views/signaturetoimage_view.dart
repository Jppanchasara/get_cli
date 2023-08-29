// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signaturetoimage_controller.dart';
import 'package:signature/signature.dart';

class SignaturetoimageView extends GetView<SignaturetoimageController> {
  const SignaturetoimageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 9,
          child: Obx(() => Signature(
              controller: controller.signatureController,
              backgroundColor: controller.padColor.value)),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.selectPadColor();
                  },
                  child: Text(
                    "Pad Color",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.selectPenColor();
                  },
                  child: Text(
                    "Pen Color",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent),
                ),
                ElevatedButton(
                  onPressed: () {
                  controller.exportSignuture();},
                  child: Text(
                    "Export",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.signatureController.clear();
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
