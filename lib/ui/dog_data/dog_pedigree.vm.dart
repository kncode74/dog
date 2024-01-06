import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';

class DogPedigreeBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<DogPedigreeVM>(
      () => DogPedigreeVM(),
      fenix: true,
    );
  }
}

class DogPedigreeVM extends BaseController {
  
}
