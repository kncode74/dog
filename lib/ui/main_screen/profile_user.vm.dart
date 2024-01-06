import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';

class ProfileUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUserViewModel>(
      () => ProfileUserViewModel(),
    );
  }
}

class ProfileUserViewModel extends BaseController {}
