import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_dog.vm.dart';

class EditDogView extends BaseView<EditDogVM> {
  @override
  void onInit() {
    controller.init();
    super.onInit();
  }

  TextEditingController _statusController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _speciesController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: 'Edit Profile',
          textOnTap: 'save',
          onTap: () {
            controller.updateData(
              _statusController.text,
              _idController.text,
              _speciesController.text,
              _sexController.text,
              _priceController.text,
            );
          }).editAppbar,
      body: Obx(
        () {
          _statusController = TextEditingController(
              text: controller.dogDetail.value?.status ?? '');
          _idController =
              TextEditingController(text: controller.dogDetail.value?.id ?? '');
          _speciesController = TextEditingController(
              text: controller.dogDetail.value?.species ?? '');
          _sexController = TextEditingController(
              text: controller.dogDetail.value?.sex ?? '');
          _priceController = TextEditingController(
              text: controller.dogDetail.value?.price ?? '');
          return Column(
            children: [
              TextFormFieldTheme(
                controller: _statusController,
                listForDropdown: ChoiceData.sell,
                hintText: i18n.status.tr,
              ).dropdownButtonFormField,
              TextFormFieldTheme(
                controller: _speciesController,
                listForDropdown: ChoiceData.species,
                hintText: i18n.species.tr,
              ).dropdownButtonFormField,
              TextFormFieldTheme(
                controller: _sexController,
                listForDropdown: ChoiceData.sex,
                hintText: i18n.sex.tr,
              ).dropdownButtonFormField,
              TextFormFieldTheme(
                controller: _priceController,
                hintText: i18n.price.tr,
              ).textFormFieldPrice,
            ],
          );
        },
      ),
    );
  }
}
