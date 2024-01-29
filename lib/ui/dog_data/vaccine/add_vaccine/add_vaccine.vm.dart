import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/image.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';
import 'package:image_picker/image_picker.dart';

class AddVaccineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddvaccineVM>(
      () => AddvaccineVM(),
      fenix: true,
    );
  }
}

class AddvaccineVM extends BaseController {
  Rx<File?> image = RxNullable<File>().setNull();
  ApiRepository repository = ApiRepository();
  String id = Get.arguments?['dogId'];
  late firebase_storage.Reference ref;

  init() {
    print(id);
  }

  addToFireStore(
    String date,
    String vaccine,
  ) async {
    try {
      String url = await _uploadToStorage();
      CollectionReference dogCollection =
          FirebaseFirestore.instance.collection('dog');
      await dogCollection.doc(id).collection('vaccine').add({
        'date': date,
        'vaccine': vaccine,
        'image': url,
      });
      print('Data added to Firestore successfully.');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
    Get.back();
  }

  _uploadToStorage() async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('vaccine_images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(image.value!);
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Loading picture : $e");
    }
  }

  pickImages() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect != null) {
      image.value = File(imageSelect.path);
    }
  }
}
