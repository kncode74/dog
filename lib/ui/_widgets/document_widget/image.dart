import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageManage {
  File? image;

  ImageManage(this.image);

  pickImages() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect != null) {
      image = File(imageSelect.path);
    }
  }

  pickCamera() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageSelect != null) {
      image = File(imageSelect.path);
    }
  }
}
