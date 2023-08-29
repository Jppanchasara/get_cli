import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/imagepicker_controller.dart';

class ImagepickerView extends GetView<ImagepickerController> {
  const ImagepickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagepickerController imagepickerController =
        Get.put(ImagepickerController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('ImagepickerView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text('Camera',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              
              Obx(() => Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black)

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                        
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  imagepickerController.imagepath.isNotEmpty
                                      ? FileImage(File(
                                          imagepickerController.imagepath.toString()))
                                      : null),
                                    
                          ElevatedButton(
                              onPressed: () {
                                imagepickerController.getImagePicker();
                              },
                              child: Text("upload image",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                       
                        ],
                      ),
                ),
              )),
              Divider(color: Colors.black87,thickness: 1),
              Text('Gallery',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              
              Obx(() => Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black)

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: [
                        
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  imagepickerController.imageGPath.isNotEmpty
                                      ? FileImage(File(
                                          imagepickerController.imageGPath.toString()))
                                      : null),
                                    
                          ElevatedButton(
                              onPressed: () {
                                imagepickerController.setImagePicker();
                              },
                              child: Text("upload image",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                       
                        ],
                      ),
                ),
              )),
              
                  
            ],
          ),
        ));
  }
}
