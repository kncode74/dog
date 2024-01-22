import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';

class DogVaccineBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<DogVaccineVM>(
      () => DogVaccineVM(),
    );
  }
}

class DogVaccineVM extends BaseController {
  ApiRepository repository = ApiRepository();
  String id = Get.arguments?['dogId'] ?? 'NO data';
  RxList<DogInstance> dogVaccine = <DogInstance>[].obs;

  init() async {
    dogVaccine.value = await repository.dogVaccine(id);
  }
}
