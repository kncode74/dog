import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/detection.view.dart';
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
  late PageController pageController;
  List<Widget> tapList = [
    DogCard(),
    DetectionView(),
    ProfileUserView(),
  ];

  var selectIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  navigatorBottom(int index) {
    selectIndex.value = index;
    pageController.jumpToPage(index);
  }
}
