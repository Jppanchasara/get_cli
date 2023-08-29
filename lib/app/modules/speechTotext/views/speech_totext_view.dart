import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/speech_totext_controller.dart';

class SpeechTotextView extends GetView<SpeechTotextController> {
  const SpeechTotextView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SpeechTotextView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Obx(() => Text(
                    controller.speechText.value,
                    style: TextStyle(fontSize: 30),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
            animate: controller.isListening.value,
            glowColor: Colors.blue,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: FloatingActionButton(
              onPressed: () {
                controller.listen();
              },
              child: Icon(
                  controller.isListening.value ? Icons.mic : Icons.mic_none),
            ),
          )),
    );
  }
}
