import 'dart:io';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/argument_key.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectionDogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetectionDogVM>(
      () => DetectionDogVM(),
      fenix: true,
    );
  }
}

class DetectionDogVM extends BaseController {
  int dogType = Get.arguments[ArgumentkeyStr.dogType];
  RxBool isLoading = true.obs;
  Rx<File?> image = Rx<File?>(null);
  RxList<dynamic> output = <dynamic>[].obs;
}
