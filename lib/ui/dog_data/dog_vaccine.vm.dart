import 'dart:html';

import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';

class DogVaccineBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<DogVaccineVM>(
      () => DogVaccineVM(),
    );
  }
}

class DogVaccineVM extends BaseController {}
