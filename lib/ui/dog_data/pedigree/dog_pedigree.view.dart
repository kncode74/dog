import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/ui_constants.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_content.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/image.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/dog_pedigree.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/edit_pedigree/edit_pedigree.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/edit_pedigree/edit_pedigree.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
import 'package:image_picker/image_picker.dart';

// TODO รับสายพันธุ์ผ่าน argument
class DogPedigreeView extends BaseView<DogPedigreeVM> {
  DogPedigreeView() : super() {
    Get.put(DogPedigreeVM());
  }

  @override
  void onInit() {
    super.onInit();
    controller.init();
    print(controller.dogDetail.value?.pedigree ?? '');
  }

  Widget _listContent(
    String image,
    String title,
    String id,
    String breed,
    String sex,
  ) {
    return InkWell(
      onTap: () {
        Get.offAll(
          TabBarDogView(),
          arguments: {'dogId': id},
          binding: TabBarDogBinding(),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: ThemeData().secondColor(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 10),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(image),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${title.tr} : $id',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('$breed , $sex'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().background1(),
      body: Obx(() {
        var dog = controller.dogDetail.value;
        return SingleChildScrollView(
          child: Column(
            children: [
              DocumentCard(
                widget: Column(
                  children: [
                    DocumentContent(
                      isLast: true,
                      title: i18n.dogPedigreeCertificate.tr,
                      widgetList: [
                        InkWell(
                          onTap: () {
                            _upLoadPedigree(context, dog?.pedigree ?? '');
                          },
                          child: CachedNetworkImageWidget(
                              heightPlace: 150,
                              imageUrl: dog?.pedigree ?? '',
                              imageDefaultUrl: icon.placeHolder),
                        ),
                      ],
                    ),
                    _listContent(
                      icon.male,
                      i18n.dad,
                      dog?.dad ?? '',
                      i18n.pomeranian.tr,
                      i18n.male.tr,
                    ),
                    VSpacings.small,
                    _listContent(
                      icon.female,
                      i18n.mom,
                      dog?.mom ?? '',
                      i18n.pomeranian.tr,
                      i18n.female.tr,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  _upLoadPedigree(BuildContext context, String pedigree) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          //TODO refactor การแสดงภาพตอนอัพโหลด เพิ่ม แก้ไข
          () => AlertDialog(
            title: controller.image.value != null
                ? Image.file(
                    controller.image.value!,
                  )
                : Image.network(pedigree.isNotEmpty ? pedigree : ''),
            content: TextButton(
              onPressed: () async {
                await controller.pickImages();
              },
              child: Text('edit photo'),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancel'),
                onPressed: () {
                  Get.back();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Done'),
                onPressed: () async {
                  await controller.addToStore().then((_) {
                    controller.init();
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _listdog(String dog) {
    return InkWell(
      onTap: () {
        Get.to(
          EditPedigreeView(),
          binding: EditPedigreeBinding(),
          arguments: {'dog': controller.dogDetail.value},
        )?.then((_) => controller.init());
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
          ),
          title: dog.isEmpty ? Text(i18n.noData.tr) : Text(dog),
        ),
      ),
    );
  }
}
