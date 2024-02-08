import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/ui_space.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/button_style.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/add_data/add_data.vm.dart';

class AddDataDog extends BaseView<AddDataDogViewModel> {
  TextEditingController idController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController speciesController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController birthDayController = TextEditingController();
  TextEditingController _takeController = TextEditingController();
  TextEditingController _dadController = TextEditingController();
  TextEditingController _momController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<Step> getStep(BuildContext context) => [
        Step(
          isActive: controller.currentStep >= 0,
          state: controller.currentStep > 0
              ? StepState.complete
              : StepState.disabled,
          title: Text(i18n.personalInformation.tr),
          content: Column(
            children: [
              TextFormFieldTheme(
                controller: statusController,
                isOutline: true,
                hintText: i18n.status.tr,
                listForDropdown: ChoiceData.sell,
              ).dropdownButtonFormField,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: idController,
                isOutline: true,
                hintText: i18n.id.tr,
                listForDropdown: ChoiceData.sell,
              ).defaultTextFormField,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: speciesController,
                isOutline: true,
                hintText: i18n.species.tr,
                listForDropdown: ChoiceData.species,
              ).dropdownButtonFormField,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: sexController,
                isOutline: true,
                hintText: i18n.sex.tr,
                listForDropdown: ChoiceData.sex,
              ).dropdownButtonFormField,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: sexController,
                isOutline: true,
                hintText: i18n.price.tr,
              ).textFormFieldPrice,
            ],
          ),
        ),
        Step(
          isActive: controller.currentStep >= 0,
          state: controller.currentStep > 0
              ? StepState.complete
              : StepState.disabled,
          title: Text(i18n.information.tr),
          content: Column(
            children: [
              TextFormFieldTheme(
                context: context,
                controller: birthDayController,
                isOutline: true,
                hintText: i18n.birthDay.tr,
              ).textFormFieldForBirthDay,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: weightController,
                isOutline: true,
                hintText: i18n.weight.tr,
              ).textFieldDecimalSet,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: heightController,
                isOutline: true,
                hintText: i18n.height.tr,
              ).textFieldDecimalSet,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: colorController,
                isOutline: true,
                hintText: i18n.color.tr,
                listForDropdown: ChoiceData.color,
              ).dropdownButtonFormField,
              VSpacings.xSmall,
              TextFormFieldTheme(
                context: context,
                controller: _takeController,
                isOutline: true,
                hintText: i18n.take.tr,
              ).textFormFieldForBirthDay,
            ],
          ),
        ),
        Step(
          isActive: controller.currentStep >= 0,
          state: controller.currentStep > 0
              ? StepState.complete
              : StepState.disabled,
          title: Text(i18n.breedInformation.tr),
          content: Column(
            children: [
              TextFormFieldTheme(
                controller: _dadController,
                isOutline: true,
                hintText: i18n.dad.tr,
              ).textFormFieldForBirthDay,
              VSpacings.xSmall,
              TextFormFieldTheme(
                controller: _momController,
                isOutline: true,
                hintText: i18n.mom.tr,
              ).textFormFieldForBirthDay,
            ],
          ),
        ),
      ];

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Add Data of Dogs').defaultAppbar,
      body: Obx(
        () => Theme(
          data: ThemeData(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: ThemeData().secondColor(),
                ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  currentStep: controller.currentStep.value,
                  steps: getStep(context),
                  onStepTapped: (int index) {
                    controller.currentStep.value = index;
                  },
                  onStepContinue: () {
                    controller.currentStep += 1;
                  },
                  onStepCancel: () {
                    controller.currentStep -= 1;
                  },
                ),
              ),
              MyButtonTheme(
                      onFunction: () {
                        // if (formKey.currentState != null &&
                        //     formKey.currentState!.validate()) {
                        controller.saveData(
                          id: idController.text,
                          status: statusController.text,
                          price: priceController.text,
                          sex: sexController.text,
                          species: speciesController.text,
                          birthDay: birthDayController.text,
                          weight: weightController.text,
                          height: heightController.text,
                          color: colorController.text,
                          take: _takeController.text,
                          dad: _dadController.text,
                          mom: _momController.text,
                        );
                        // }
                      },
                      nameButton: 'Done')
                  .outlineButton()
              // MyButtonTheme(
              ,
            ],
          ),
        ),
      ),
    );
  }
// Form(
// key: formKey,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: SingleChildScrollView(
// child: Column(
// children: [
//
// VSpacings.medium,
// MyButtonTheme(
// onFunction: () {
// if (formKey.currentState != null &&
// formKey.currentState!.validate()) {
// controller.saveData(
// idController.text,
// priceController.text,
// colorController.text,
// statusController.text,
// speciesController.text,
// sexController.text,
// birthDayController.text,
// weightController.text,
// heightController.text,
// );
// }
// },
// nameButton: 'Done')
//     .outlineButton(),
// ],
// ),
// ),
// ),
// ),
// TextFormFieldTheme(
// controller: idController,
// labels: 'Id of dog',
// textWarning: 'please ',isOutline: true)
//     .defaultTextFormField,
// TextFormFieldTheme(
// controller: priceController,
// labels: 'price of dog',
// textWarning: 'please ')
//     .textFormFieldPrice,
// TextFormFieldTheme(
// controller: colorController,
// listForDropdown: ChoiceData.color,
// hintText: 'color')
//     .dropdownButtonFormField,
// TextFormFieldTheme(
// controller: sexController,
// listForDropdown: ChoiceData.sex,
// hintText: 'sex')
//     .dropdownButtonFormField,
// TextFormFieldTheme(
// controller: statusController,
// listForDropdown: ChoiceData.sell,
// hintText: 'status')
//     .dropdownButtonFormField,
// TextFormFieldTheme(
// controller: speciesController,
// listForDropdown: ChoiceData.species,
// hintText: 'species')
//     .dropdownButtonFormField,
// TextFormFieldTheme(
// controller: weightController,
// labels: 'weight',
// textWarning: 'please..')
//     .textFieldDecimalSet,
// TextFormFieldTheme(
// controller: heightController,
// labels: 'height',
// textWarning: 'please..')
//     .textFieldDecimalSet,
// TextFormFieldTheme(
// controller: birthDayController,
// labels: 'birth day',
// context: context)
//     .textFormFieldForBirthDay,
}
