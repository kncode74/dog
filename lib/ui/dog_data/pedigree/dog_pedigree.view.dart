import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/image.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/dog_pedigree.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/edit_pedigree/edit_pedigree.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/edit_pedigree/edit_pedigree.vm.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 247, 1),
      body: Obx(() {
        var dog = controller.dogDetail.value?.pedigree ?? '';
        return SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _upLoadPedigree(context, dog);
                },
                child: DocumentCard(
                  widget: Container(
                    margin: EdgeInsets.all(20),
                    height: 150,
                    width: 150,
                    child: Column(
                      children: [
                        Image.network(
                          dog.isNotEmpty ? dog : '',
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 50,
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              _listdog(controller.dogDetail.value?.dad ?? ''),
              _listdog(controller.dogDetail.value?.mom ?? ''),
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
