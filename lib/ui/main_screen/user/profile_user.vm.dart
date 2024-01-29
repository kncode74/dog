import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/farm.dart';
import 'package:getx_mvvm_boilerplate/ui/null_helper.dart';

class ProfileUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileUserViewModel>(
      () => ProfileUserViewModel(),
    );
  }
}

class ProfileUserViewModel extends BaseController {
  final Rx<Farm?> farmDetail = RxNullable<Farm?>().setNull();
  final ApiRepository _apiRepository = ApiRepository();

  init() async {
    farmDetail.value =
        await _apiRepository.farmDetail('khongkhuan49@gmail.com');
  }
}
