import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:tflite/tflite.dart';

class DetectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetectionViewModel>(
      () => DetectionViewModel(),
    );
  }
}

class DetectionViewModel extends BaseController {
  RxBool loading = true.obs;
  Rx<File?> image = Rx<File?>(null);
  RxList<dynamic> output = <dynamic>[].obs;

  init() {
    loadModel().then((value) {
      loading.value = false;
    });
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }
}
