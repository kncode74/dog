import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/select_detection.view.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/dog_card.view.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.vm.dart';

class NavigatorView extends BaseView<NavigatorViewModel> {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => controller.tapList.elementAt(controller.selectIndex.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              icon.bottom1,
              height: 36,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              icon.bottom2,
              height: 36,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              icon.bottom3,
              height: 36,
            ),
            label: '',
          ),
        ],
        currentIndex: controller.selectIndex.value,
        selectedItemColor: const Color.fromRGBO(83, 129, 36, 1),
        onTap: controller.navigatorBottom,
      ),
    );
  }

}
