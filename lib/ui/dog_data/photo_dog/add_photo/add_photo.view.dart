import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/add_photo/add_photo.vm.dart';

class AddPhotoDogView extends BaseView<AddPhotoDogVM> {
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget render(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: MainAppBar(
            title: 'Add Photo',
            textOnTap: 'Save',
            onTap: () {
              controller.uploadImages().then(
                    (_) => controller
                        .addDataToFirestore(descriptionController.text),
                  );
            },
          ).editAppbar,
          body: Column(
            children: [
              TextFormFieldTheme(
                controller: descriptionController,
                labels: 'description',
                textWarning: 'please fill description',
              ).defaultTextFormField,
              Expanded(
                child: GridView.builder(
                  itemCount: controller.imageFileList!.value.length + 1,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Center(
                            child: IconButton(
                                onPressed: () => !(controller.uploading.value)
                                    ? controller.selectImages()
                                    : null,
                                icon: const Icon(Icons.add)),
                          )
                        : Container(
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(controller
                                      .imageFileList!.value[index - 1].path)),
                                  fit: BoxFit.cover),
                            ),
                          );
                  },
                ),
              ),
              controller.uploading.value
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('uploading....'),
                          const SizedBox(
                            height: 10,
                          ),
                          CircularProgressIndicator(
                            value: controller.val.value,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
