import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class DogDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogDataViewModel>(() => DogDataViewModel(), fenix: true);
  }
}

class DogDataViewModel extends BaseController {
  ApiRepository repository = ApiRepository();
  String id = Get.arguments?['dogId'] ?? 'NO data';
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();

  init() async {
    dogDetail.value = await repository.dogDetailData(id);
    print(dogDetail.value);
  }
}
