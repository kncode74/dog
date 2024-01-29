import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.view.dart';
import 'package:getx_mvvm_boilerplate/ui/navigator_screen/navigator_screen.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/splash_screen/splash_screen.vm.dart';
import '../../application/base/base_view.dart';

class SplashScreenView extends BaseView<SplashScreenController> {
  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon.iconLogo),
            TextButton(
              onPressed: () {
                Get.offAll(
                  NavigatorView(),
                  binding: NavigatorBinding(),
                );
              },
              child: Text(i18n.tapToContinue.tr),
            ),
          ],
        ),
      ),
    );
  }
}
