import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
  List<String> listImage = [];
  late firebase_storage.Reference ref;
  CollectionReference imageDog = FirebaseFirestore.instance.collection('dog');
  String id = Get.arguments?['dogId'];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (imageFileList != null) {
      imageFileList!.value = selectedImages;
      print("Image List Length: ${imageFileList!.length}");
      print("Image Path: ${imageFileList}");
    }
  }

  Future<void> uploadImages() async {
    for (int i = 0; i < imageFileList!.value.length; i++) {
      try {
        final fileName = DateTime.now().millisecondsSinceEpoch.toString();
        ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('images')
            .child(fileName);
        await ref.putFile(File(imageFileList?.value[i].path ?? ''),
            firebase_storage.SettableMetadata(contentType: 'image/jpg'));

        final imageUrl = await ref.getDownloadURL();

        listImage.add(imageUrl);
      } catch (e) {
        print("Loading picture : $e");
      }
    }
  }

  Future<void> addDataToFirestore(String description) async {
    Map<String, dynamic> data = {
      'description': description,
      'images': listImage,
    };
    try {
      await imageDog.doc(id).collection('images').doc().set(data);
    } catch (e) {
      print("Add picture : $e");
    }
    Get.back();
  }
}
