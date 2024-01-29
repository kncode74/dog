import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class DogPhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogPhotoVM>(() => DogPhotoVM(), fenix: true);
  }
}

class DogPhotoVM extends BaseController {
  RxList<DogInstance> dogImagesList = <DogInstance>[].obs;
  String id = Get.arguments?['dogId'] ?? 'NO data';
  final Rx<DogInstance?> dogDetail = RxNullable<DogInstance?>().setNull();
  final ApiRepository _repository = ApiRepository();

  init() async {
    dogDetail.value = await _repository.dogDetailData(id);
    loadData();
  }

  loadData() async {
    dogImagesList.value =
        await _repository.dogImages(dogDetail.value?.id ?? '');
    print(dogDetail.value?.id ?? '');
  }
}
