import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/image.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/add_vaccine/add_vaccine.vm.dart';
import 'package:image_picker/image_picker.dart';

class AddVacineView extends BaseView<AddvaccineVM> {
  AddVacineView() {
    Get.put(AddvaccineVM());
  }

  @override
  void onInit() {
    controller.init();
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController vaccineTypeController = TextEditingController();

  @override
  Widget render(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: MainAppBar(
            title: "Add vaccine",
            textOnTap: 'save',
            onTap: () async {
              controller.addToFireStore(
                dateController.text,
                vaccineTypeController.text,
              );
            },
          ).editAppbar,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormFieldTheme(
                      controller: dateController,
                      hintText: 'Date',
                      context: context)
                  .textFormFieldForBirthDay,
              TextFormFieldTheme(
                      controller: vaccineTypeController,
                      hintText: 'vaccine type',
                      listForDropdown: ChoiceData.vaccine)
                  .dropdownButtonFormField,
              controller.image.value != null
                  ? Image.file(
                      controller.image.value!,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : OutlinedButton(
                      onPressed: () async {
                        await controller.pickImages();
                        print(controller.image.value);
                      },
                      child: Text('Add Photos'),
                    ),
            ],
          ),
        );
      },
    );
  }
}
