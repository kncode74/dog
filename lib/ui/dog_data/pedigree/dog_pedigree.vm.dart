import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';
import 'package:image_picker/image_picker.dart';

class DogPedigreeBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<DogPedigreeVM>(
      () => DogPedigreeVM(),
      fenix: true,
    );
  }
}

class DogPedigreeVM extends BaseController {
  ApiRepository repository = ApiRepository();
  String id = Get.arguments?['dogId'] ?? 'NO data';
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();
  Rx<File?> image = RxNullable<File>().setNull();

  init() async {
    dogDetail.value = await repository.dogDetailData(id);
    print(dogDetail.value?.pedigree ?? '');
  }

  upLoadPhoto() async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('pedigree_images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(image.value!);
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Loading picture : $e");
    }
  }

  addToStore() async {
    try {
      String url = await upLoadPhoto();
      CollectionReference dogCollection =
          FirebaseFirestore.instance.collection('dog');

      await dogCollection.doc(dogDetail.value?.id ?? '').update(
        {'pedigree': url},
      );
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
    Get.back();
  }

  pickImages() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect != null) {
      image.value = File(imageSelect.path);
    }
  }
}
