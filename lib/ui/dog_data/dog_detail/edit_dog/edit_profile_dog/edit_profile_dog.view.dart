import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_profile_dog/edit_profile_dog.vm.dart';

class EditProfileDogView extends BaseView<EditProfileDogVM> {
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
          title: 'Edite Profile',
          textOnTap: i18n.save.tr,
          onTap: () async {
            await controller.addToStore();
          }).editAppbar,
      body: Obx(
        () {
          var profile = controller.dogDetail.value?.profileImage ?? '';
          _statusController = TextEditingController(
              text: controller.dogDetail.value?.status ?? '');
          _speciesController = TextEditingController(
              text: controller.dogDetail.value?.species ?? '');
          _sexController = TextEditingController(
              text: controller.dogDetail.value?.sex ?? '');
          _priceController = TextEditingController(
              text: controller.dogDetail.value?.price ?? '');
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.pickImages();
                },
                child: profile.isNotEmpty
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(profile),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: controller.image.value != null
                            ? FileImage(controller.image.value!)
                            : null,
                      ),
              ),
              Divider(
                color: Colors.blue,
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text('data'),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormFieldTheme(
                      controller: _statusController,
                      listForDropdown: ChoiceData.sell,
                      hintText: i18n.status.tr,
                    ).dropdownButtonFormField,
                  )
                ],
              ),
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
