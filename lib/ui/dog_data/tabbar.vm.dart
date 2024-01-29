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
  Rx<DogInstance?> dogDetail = RxNullable<DogInstance>().setNull();
  RxList<DogInstance> dogList = <DogInstance>[].obs;
  ApiRepository _repository = ApiRepository();
  RxList<DogInstance> filterDog = <DogInstance>[].obs;
  String id = Get.arguments?['dogId'] ?? 'NO data';

  init() async {
    _loadDogData();
    await _loadDogList();
    filterDogList();
  }

  _loadDogList() async {
    dogList.value = await _repository.dogData();
  }

  _loadDogData() async {
    try {
      dogDetail.value = await _repository.dogDetailData(id);
    } catch (e) {
      print('Error fetching dog data: $e');
    }
  }

  filterDogList() {
    final sameBreed = dogDetail.value?.species ?? '';
    final sameColor = dogDetail.value?.color ?? '';
    final sameSex = dogDetail.value?.sex ?? '';
    filterDog.value = dogList
        .where((dog) =>
            dog.species == sameBreed &&
            dog.color == sameColor &&
            dog.sex == sameSex)
        .toList();
    filterDog.value.removeWhere((dog) => dog.id == dogDetail.value?.id);
  }
}
