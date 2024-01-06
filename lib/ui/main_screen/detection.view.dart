import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/button_style.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection.dog.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection_dog.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/detection.vm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectionView extends BaseView<DetectionViewModel> {
  DetectionView() {
    Get.put(DetectionViewModel());
    // controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(title: 'Detection').defaultAppbar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 230),
            selectDetection(
              'Dog Face',
              'ภาพใบหน้าของสุนัข',
              'images/nose.jpg',
              DetectionDogView(),
            ),
            const SizedBox(
              height: 20,
            ),
            selectDetection(
              'Dog Nose',
              'ภาพจมูกของสุนัข',
              'images/face.jpg',
              DetectionDogView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectDetection(
      String title, String subTitle, String image, Widget dectection) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 215, 215, 215), // สีของเงา
                  offset: Offset(0, 2), // ตำแหน่งเงาแนวแกน X และ Y
                  blurRadius: 5.0, // รัศมีของเงา
                  spreadRadius: 2.0, // การกระจายของเงา
                )
              ]),
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 110,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Positioned(
                  top: 47,
                  left: 110,
                  child: Text(
                    subTitle,
                    style: const TextStyle(fontSize: 16),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 37,
                        backgroundImage: AssetImage(image),
                      ),
                      const SizedBox(
                        width: 185,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(DetectionDogView(),
                              binding: DetectionDogBinding());
                        },
                        child: const Icon(
                          Icons.arrow_circle_right,
                          size: 40,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
