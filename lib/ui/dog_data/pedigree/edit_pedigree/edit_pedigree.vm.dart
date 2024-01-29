import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class EditPedigreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPedigreeVM>(
      () => EditPedigreeVM(),
    );
  }
}

class EditPedigreeVM extends BaseController {
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();

  init() {
    dogDetail.value = Get.arguments['dog'];
    print(dogDetail.value);
  }

  updateData(String dad, String mom) async {
    try {
      String docId = dogDetail.value?.id ?? '';
      CollectionReference dogCollection =
          FirebaseFirestore.instance.collection('dog');
      await dogCollection.doc(docId).update(
        {
          'dad': dad,
          'mom': mom,
        },
      );
      Get.back();
    } catch (e) {
      print('error: $e');
    }
  }
}
