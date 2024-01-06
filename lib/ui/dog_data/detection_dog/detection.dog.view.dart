import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/button_style.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection_dog.vm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectionDogView extends BaseView<DetectionDogVM> {
  @override
  onInit() {
    controller.init();
    print(controller.loading);
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar:
          MainAppBar(title: "dog", images: 'images/face.jpg').detectionAppbar,
      body: Obx(
        () {
          return Column(
            children: [
              controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          controller.image?.value == null
                              ? Container()
                              : SizedBox(
                                  height: 300,
                                  width: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: controller.image?.value != null
                                        ? Image.file(
                                            controller.image!.value,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(),
                                  ),
                                ),
                          controller.output.isNotEmpty
                              ? InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'ID : ${controller.output[0]['label'].split(' ')[1]}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Text('search dog')],
                                  ),
                                )
                        ],
                      ),
                    ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          controller.pickcamaraImage();
                        },
                        child: Text('camera'))
                    // MyButtonTheme(
                    //   nameButton: 'Gallary',
                    //   onFunction: pickImage,
                    // ).outlineButton(),
                    // MyButtonTheme(
                    //   nameButton: 'camera',
                    //   onFunction: pickcamaraImage,
                    // ).outlineButton()
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
