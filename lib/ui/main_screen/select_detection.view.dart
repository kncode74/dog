import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/argument_key.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/constant.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/detection_content.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection.dog.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection_dog.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/select_detection.vm.dart';

class SelectDetectionView extends BaseView<SelectDetectionVM> {
  SelectDetectionView() {
    Get.put(SelectDetectionVM());
    // controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(title: 'Detection').mainAppbar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(
                  DetectionDogView(),
                  binding: DetectionDogBinding(),
                  arguments: {
                    ArgumentkeyStr.dogType: DogDetection.face,
                  },
                );
              },
              child: ContentDetection(
                title: i18n.dogFace.tr,
                subTitle: i18n.dogFacePicture.tr,
                image: icon.nose,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(
                  DetectionDogView(),
                  binding: DetectionDogBinding(),
                  arguments: {
                    ArgumentkeyStr.dogType: DogDetection.nose,
                  },
                );
              },
              child: ContentDetection(
                title: i18n.dogNose.tr,
                subTitle: i18n.dogNosePicture.tr,
                image:icon.face,
              ),
            )
          ],
        ),
      ),
    );
  }
}
