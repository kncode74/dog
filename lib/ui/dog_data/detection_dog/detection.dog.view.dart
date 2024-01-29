import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/ui_constants.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/detection_dog/detection_dog.vm.dart';

class DetectionDogView extends BaseView<DetectionDogVM> {
  @override
  void onInit() {
    super.onInit();
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: controller.dogType == 1
          ? MainAppBar(
        title: "Dog Face",
        images: icon.nose,
      ).detectionAppbar
          : MainAppBar(
        title: "Dog Nose",
        images: icon.face,
      ).detectionAppbar,
      body: Column(
        children: [
          Obx(
                () =>
            controller.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.image?.value == null
                      ? Container()
                      : SizedBox(
                    height: 300,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: controller.image?.value != null
                          ? Image.file(
                        controller.image.value!,
                        fit: BoxFit.cover,
                      )
                          : Container(),
                    ),
                  ),
                  controller.output.value.isNotEmpty
                      ? InkWell(
                    onTap: () {
                      controller.clickAndShow();
                    },
                    child: Text(
                      'ID : ${controller.output[0]['label'].split(' ')[1]}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                      : Center(child: _placeDetection())
                ],
              ),
            ),
          ),
          _button(),
        ],
      ),
    );
  }

  Widget _placeDetection() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 380,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(
                      controller.dogType == 1 ? icon.nose : icon.face),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(i18n.search.tr)
          ],
        ),
        Positioned(
          left: 40,
          top: 45,
          child: SvgPicture.asset(icon.scan),
        ),
      ],
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: ThemeData().secondColor(),
                ),
              ),
              onPressed: () async {
                await controller.pickImage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon.gallery),
                  HSpacings.xxxSmall,
                  Text(
                    i18n.gallery.tr,
                    style: TextStyle(
                      color: ThemeData().secondColor(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          HSpacings.medium,
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeData().secondColor()),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(icon.camera),
                  HSpacings.xxxSmall,
                  Text(
                    i18n.camera.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
