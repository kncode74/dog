import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/detection.view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/dog_card.view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/profile_user.view.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.vm.dart';

class NavigatorView extends BaseView<NavigatorViewModel> {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: [
          DogCard(),
          DetectionView(),
          ProfileUserView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _bottomBar(context, 'images/bottom1.png', 0, 36),
          _bottomBar(context, 'images/bottom2.png', 1, 36),
          _bottomBar(context, 'images/bottom3.png', 2, 36)
        ],
      )),
    );
  }

  Widget _bottomBar(
      BuildContext context, String image, int page, double height) {
    return InkWell(
      onTap: () => controller.navigatorBottom(page),
      child: Column(
        children: [
          Image.asset(
            image,
            height: height,
          )
        ],
      ),
    );
  }
}
