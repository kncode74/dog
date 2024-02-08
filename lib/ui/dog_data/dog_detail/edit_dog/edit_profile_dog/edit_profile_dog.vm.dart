import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileDogBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<EditProfileDogVM>(
      () => EditProfileDogVM(),
      fenix: true,
    );
  }
}

class EditProfileDogVM extends BaseController {
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();
  CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dog');
  Rx<File?> image = RxNullable<File>().setNull();

  init() {
    dogDetail.value = Get.arguments['dog'];
    print(dogDetail.value?.id ?? '');
  }

  pickImages() async {
    final imageSelect =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageSelect != null) {
      image.value = File(imageSelect.path);
    }
  }

  upLoadPhoto() async {
    try {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(image.value!);
      await uploadTask.whenComplete(() => null);

      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Loading picture : $e");
    }
  }

  addToStore({
    String? status,
    String? species,
    String? price,
    String? sex,
    String? birthDay,
    String? color,
    String? weight,
    String? height,
    String? take,
    String? out,
  }) async {
    try {
      String? url;
      if (image.value != null) {
        url = await upLoadPhoto();
      }

      Map<String, dynamic> updateData = {
        if (url != null) 'image_profile': url,
        'price': price,
        'color': color,
        'sex': sex,
        'species': species,
        'status': status,
        'birth_day': birthDay,
        'take': take,
        'out': out,
        'weight': weight,
        'height': height,
      };
      if (updateData.isNotEmpty) {
        await dogCollection.doc(dogDetail.value?.id ?? '').update(updateData);
      }

      print(dogDetail.value?.id ?? '');
    } catch (e) {
      print('Error adding data to Firestore: $e');
    }
    Get.back();
  }
}
