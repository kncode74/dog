import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoDogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPhotoDogVM>(() => AddPhotoDogVM(), fenix: true);
  }
}

class AddPhotoDogVM extends BaseController {
  RxBool uploading = false.obs;
  RxList<File> image = <File>[].obs;
  RxList<XFile>? imageFileList = <XFile>[].obs;
  ImagePicker imagePicker = ImagePicker();
  RxDouble val = 0.0.obs;
  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages != null) {
      imageFileList = selectedImages as RxList<XFile>?;
      print("Image List Length: ${imageFileList!.length}");
    }
  }
}
