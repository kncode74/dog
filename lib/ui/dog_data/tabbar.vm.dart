import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class TabBarDogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabbarDogVM>(
      () => TabbarDogVM(),
    );
  }
}

class TabbarDogVM extends BaseController {
  Rx<DogInstance? >dogList = RxNullable<DogInstance>().setNull();

  ApiRepository repository = ApiRepository();

  String id = Get.arguments?['dogId'] ?? 'NO data';

  init() {
    loadDogData();
  }

  loadDogData() async {
    try {
      dogList.value = await repository.dogDetailData(id);
    } catch (e) {
      print('Error fetching dog data: $e');
    }
  }
}
