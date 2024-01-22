import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class EditPhotoBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<EditPhotoVM>(
      () => EditPhotoVM(),
      fenix: true,
    );
  }
}

class EditPhotoVM extends BaseController {
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();

  init() {
    dogDetail.value = Get.arguments['dog'];
    print(dogDetail.value);
  }
}
