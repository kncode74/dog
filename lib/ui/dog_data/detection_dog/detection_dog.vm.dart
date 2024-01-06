import 'dart:io';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
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
  RxBool loading = true.obs;
  Rx<File>? image;

  RxList<dynamic> output = <dynamic>[].obs;
  ImagePicker imagePicker = ImagePicker();

  init() {
    loadModel().then((_) {
      loading.value = false;
      print(loading.value);
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  Future pickImage() async {
    var imagePick = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imagePick == null) return;

    loading.value = true;
    image?.value = File(imagePick.path);

    if (image?.value != null) {
      await classifyImage(image?.value);
    }
  }

  pickcamaraImage() async {
    var imageCamara = await imagePicker.pickImage(source: ImageSource.camera);
    if (imageCamara == null) return;

    loading.value = true;
    image?.value = File(imageCamara.path);
    if (image?.value != null) {
      await classifyImage(image?.value);
    }
  }

  Future<void> classifyImage(File? image) async {
    if (image == null || image.path.isEmpty) {
      print("Image path is empty or null");
      return;
    }
    var outputdDetection = await Tflite.runModelOnImage(
      path: image?.path ?? '',
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    loading.value = false;
    output.value = outputdDetection ?? [];
  }
}
