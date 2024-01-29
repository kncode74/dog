import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';

class AddDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDataDogViewModel>(
      () => AddDataDogViewModel(),
    );
  }
}

class AddDataDogViewModel extends BaseController {
  CollectionReference dogCollection =
      FirebaseFirestore.instance.collection("dog");
  var selectedValue = 'red'.obs;

  saveData(
    String id,
    String price,
    String color,
    String status,
    String species,
    String sex,
    String birthDay,
    String weight,
    String height,
  ) async {
    Map<String, dynamic> dog = {
      'id': id,
      'price': price,
      'color': color,
      'sex': sex,
      'species': species,
      'status': status,
      'birth_day': birthDay,
      'pedigree': '',
      'image_profile': '',
      'take': '',
      'out': '',
      'dad': '',
      'mom': '',
      'etc': '',
      'weight': weight,
      'height': height,
    };
    await dogCollection.doc(id).set(dog);
    Get.back();
  }
}
