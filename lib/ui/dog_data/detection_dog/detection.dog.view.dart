import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/button_style.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection_dog.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectionDogView extends BaseView<DetectionDogVM> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  Future<void> loadModel() async {
    if (controller.dogType == 1) {
      await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
      );
      controller.isLoading.value = false;
    } else {
      await Tflite.loadModel(
        model: 'assets/nose.tflite',
        labels: 'assets/nose.txt',
      );
      controller.isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    var pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    controller.isLoading.value = true;
    controller.image.value = File(pickedImage.path);
    print('image ${controller.image.value}');
    await classifyImage(controller.image.value!);
  }

  Future<void> classifyImage(File image) async {
    var outputResult = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    controller.output.value = outputResult ?? [];
    controller.isLoading.value = false;
    await Future.delayed(const Duration(seconds: 1));

    print('Output: $outputResult');
  }

  void clickAndShow() {
    String idDog = controller.output[0]['label'].split(' ')[1];
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('dog').doc(idDog);
    documentReference.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Get.to(
          TabBarDogView(),
          arguments: {'dogId': idDog},
          binding: TabBarDogBinding(),
        );
      } else {}
    }).catchError((error) {});
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: controller.dogType == 1
          ? MainAppBar(title: "Dog Face", images: 'images/nose.jpg')
              .detectionAppbar
          : MainAppBar(title: "Dog Nose", images: 'images/face.jpg')
              .detectionAppbar,
      body: Column(
        children: [
          Obx(
            () => controller.isLoading.value
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
                                          controller.image.value!,
                                          fit: BoxFit.cover,
                                        )
                                      : Container(),
                                ),
                              ),
                        controller.output.value.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  clickAndShow();
                                },
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
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () async {
                      await pickImage();
                    },
                    child: Text('camera'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
