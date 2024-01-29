import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/argument_key.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
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
  final ImagePicker _imagePicker = ImagePicker();

  init() {
    loadModel();
  }

  Future<void> loadModel() async {
    if (dogType == 1) {
      await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
      );
      isLoading.value = false;
    } else {
      await Tflite.loadModel(
        model: 'assets/nose.tflite',
        labels: 'assets/nose.txt',
      );
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    var pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    isLoading.value = true;
    image.value = File(pickedImage.path);
    print('image ${image.value}');
    await classifyImage(image.value!);
  }

  Future<void> classifyImage(File image) async {
    var outputResult = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    output.value = outputResult ?? [];
    isLoading.value = false;
    await Future.delayed(const Duration(seconds: 1));

    print('Output: $outputResult');
  }

  void clickAndShow() {
    String idDog = output[0]['label'].split(' ')[1];
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
}
