import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/general_form_content.dart';
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
  TextEditingController _speciesController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _birtDayController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _takeController = TextEditingController();
  TextEditingController _outController = TextEditingController();

  @override
  Widget render(BuildContext context) {
    return Obx(() {
      var profile = controller.dogDetail.value?.profileImage ?? '';
      _statusController =
          TextEditingController(text: controller.dogDetail.value?.status ?? '');
      _speciesController = TextEditingController(
          text: controller.dogDetail.value?.species ?? '');
      _sexController =
          TextEditingController(text: controller.dogDetail.value?.sex ?? '');
      _priceController =
          TextEditingController(text: controller.dogDetail.value?.price ?? '');
      _colorController =
          TextEditingController(text: controller.dogDetail.value?.color ?? '');
      _birtDayController =
          TextEditingController(text: controller.dogDetail.value?.birth ?? '');
      _weightController =
          TextEditingController(text: controller.dogDetail.value?.weight ?? '');
      _heightController =
          TextEditingController(text: controller.dogDetail.value?.height ?? '');
      _takeController =
          TextEditingController(text: controller.dogDetail.value?.take ?? '');
      _outController =
          TextEditingController(text: controller.dogDetail.value?.out ?? '');
      return Scaffold(
        appBar: MainAppBar(
            title: 'Edite Profile',
            textOnTap: i18n.save.tr,
            onTap: () async {
              await controller.addToStore(
                status: _statusController.text,
                species: _speciesController.text,
                sex: _sexController.text,
                price: _priceController.text,
                birthDay: _birtDayController.text,
                weight: _weightController.text,
                height: _heightController.text,
                color: _colorController.text,
                take: _takeController.text,
                out: _outController.text,
              );
            }).editAppbar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    controller.pickImages();
                  },
                  child: CachedNetworkImageWidget(
                    imageUrl: controller.dogDetail.value?.profileImage ?? '',
                    imageDefaultUrl: icon.placeHolder,
                    heightPlace: 90,
                    imageWidgetBuilder: (context, provider) {
                      return CircleAvatar(
                        radius: 45,
                        backgroundImage: provider,
                      );
                    },
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 30,
                ),
                GeneralFormContent(
                  i18n.status.tr,
                  TextFormFieldTheme(
                    controller: _statusController,
                    hintText: i18n.status.tr,
                    listForDropdown: ChoiceData.sell,
                  ).dropdownButtonFormField,
                ),
                GeneralFormContent(
                    i18n.species.tr,
                    TextFormFieldTheme(
                      controller: _speciesController,
                      hintText: i18n.species.tr,
                      listForDropdown: ChoiceData.species,
                    ).dropdownButtonFormField),
                GeneralFormContent(
                  i18n.sex.tr,
                  TextFormFieldTheme(
                    controller: _sexController,
                    hintText: i18n.sex.tr,
                    listForDropdown: ChoiceData.sex,
                  ).dropdownButtonFormField,
                ),
                GeneralFormContent(
                  i18n.price.tr,
                  TextFormFieldTheme(
                    controller: _priceController,
                    hintText: i18n.price.tr,
                  ).textFormFieldPrice,
                ),
                GeneralFormContent(
                  i18n.birthDay.tr,
                  TextFormFieldTheme(
                    controller: _birtDayController,
                    hintText: i18n.birthDay.tr,
                    listForDropdown: ChoiceData.species,
                    context: context,
                  ).textFormFieldForBirthDay,
                ),
                GeneralFormContent(
                  i18n.weight.tr,
                  TextFormFieldTheme(
                    controller: _weightController,
                    hintText: i18n.weight.tr,
                  ).textFieldDecimalSet,
                ),
                GeneralFormContent(
                  i18n.height.tr,
                  TextFormFieldTheme(
                    controller: _heightController,
                    hintText: i18n.height.tr,
                  ).textFieldDecimalSet,
                ),
                GeneralFormContent(
                  i18n.color.tr,
                  TextFormFieldTheme(
                    controller: _colorController,
                    listForDropdown: ChoiceData.color,
                    hintText: i18n.color.tr,
                  ).dropdownButtonFormField,
                ),
                GeneralFormContent(
                  i18n.take.tr,
                  TextFormFieldTheme(
                    controller: _takeController,
                    hintText: i18n.take.tr,
                    context: context,
                  ).textFormFieldForBirthDay,
                ),
                GeneralFormContent(
                  i18n.out.tr,
                  TextFormFieldTheme(
                    controller: _outController,
                    hintText: i18n.out.tr,
                    context: context,
                  ).textFormFieldForBirthDay,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
