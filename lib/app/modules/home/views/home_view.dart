import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_cli/app/controllers/my_controller_controller.dart';
import 'package:get_cli/app/modules/imagepicker/controllers/imagepicker_controller.dart';
import 'package:get_cli/app/modules/speechTotext/views/speech_totext_view.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../imagepicker/views/imagepicker_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyControllerController myControllerController =
        Get.put(MyControllerController());
    ImagepickerController imagepickerController =
        Get.put(ImagepickerController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  myControllerController.jay.value,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                // Obx(
                //   () => Text(imagepickerController.imagepath.value == null
                //       ? ""
                //       : imagepickerController.imagepath.value),
                // ),
                // SizedBox(
                //   height: 16,
                // ),
                example(
                    title: "Image Picker",
                    icontext: "I",
                    onTap: () {
                      Get.to(ImagepickerView());
                    }),
                SizedBox(
                  height: 16,
                ),
                example(
                    title: "Speech To Text",
                    icontext: "S",
                    onTap: () {
                      Get.toNamed("/speech-totext");
                    }),
                SizedBox(
                  height: 16,
                ),
                example(
                    title: "Signature Widget & save image",
                    icontext: "S",
                    onTap: () {
                      Get.toNamed("/signaturetoimage");
                    }),
              ],
            ),
          ),
        ));
  }
}

class example extends StatelessWidget {
  final String title;
  final String icontext;
  final VoidCallback onTap;
  const example(
      {super.key,
      required this.title,
      required this.icontext,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          radius: 15,
          child: Text(icontext),
        ),
        trailing: InkWell(
          onTap: onTap,
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
