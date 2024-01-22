import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/select_detection.view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/dog_card.view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/profile_user.view.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorViewModel>(
      () => NavigatorViewModel(),
    );
  }
}

class NavigatorViewModel extends BaseController {
  var selectIndex = 0.obs;

  List<Widget> tapList = [
    DogCard(),
    SelectDetectionView(),
    ProfileUserView(),
  ];

  navigatorBottom(int index) {
    selectIndex.value = index;
  }
}
