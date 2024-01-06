import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';

class DogPhotoBinding extends Bindings{
@override
  void dependencies() {
    Get.lazyPut<DogPhotoVM>(
      () => DogPhotoVM(),
      fenix: true
    );
  }
}
class DogPhotoVM extends BaseController{

}