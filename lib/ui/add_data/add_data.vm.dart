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
  RxInt currentStep = 0.obs;

  saveData({
    required String id,
    required String price,
    required String color,
    required String status,
    required String species,
    required String sex,
    required String birthDay,
    required String weight,
    required String height,
    required String dad,
    required String mom,
    required String take,
  }) async {
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
      'take': take,
      'out': '',
      'dad': dad,
      'mom': mom,
      'etc': '',
      'weight': weight,
      'height': height,
    };
    await dogCollection.doc(id).set(dog);
    Get.back();
  }
}
