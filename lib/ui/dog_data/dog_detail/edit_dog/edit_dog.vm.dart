import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class EditDogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditDogVM>(
      () => EditDogVM(),
      fenix: true,
    );
  }
}

class EditDogVM extends BaseController {
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();
  CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dog');

  init() {
    dogDetail.value = Get.arguments['dog'];
  }

  updateData(
    String status,
    String id,
    String species,
    String sex,
    String price,
  ) async {
    try {
      await dogCollection.doc(dogDetail.value?.id ?? '').update({
        'status': status,
        'id': id,
        'species': species,
        'sex': sex,
        'price': price,
      });
      Get.back();
    } catch (e) {
      print('error: $e');
    }
  }
}
