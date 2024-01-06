import 'package:flutter/material.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
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

  final formKey = GlobalKey<FormState>();

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Add Data of Dogs').defaultAppbar,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormFieldTheme(
                        controller: idController,
                        labels: 'Id of dog',
                        textWarning: 'please ')
                    .defaultTextFormField,
                TextFormFieldTheme(
                        controller: priceController,
                        labels: 'price of dog',
                        textWarning: 'please ')
                    .textFormFieldPrice,
                TextFormFieldTheme(
                        controller: colorController,
                        listFordropdown: ChoiceData.color,
                        hintText: 'color')
                    .dropdownButtonFormField,
                TextFormFieldTheme(
                        controller: sexController,
                        listFordropdown: ChoiceData.sex,
                        hintText: 'sex')
                    .dropdownButtonFormField,
                TextFormFieldTheme(
                        controller: statusController,
                        listFordropdown: ChoiceData.sell,
                        hintText: 'status')
                    .dropdownButtonFormField,
                TextFormFieldTheme(
                        controller: speciesController,
                        listFordropdown: ChoiceData.species,
                        hintText: 'species')
                    .dropdownButtonFormField,
                TextFormFieldTheme(
                        controller: weightController,
                        labels: 'weight',
                        textWarning: 'please..')
                    .textFieldDecimalSet,
                TextFormFieldTheme(
                        controller: heightController,
                        labels: 'height',
                        textWarning: 'please..')
                    .textFieldDecimalSet,
                TextFormFieldTheme(
                        controller: birthDayController,
                        labels: 'birth day',
                        context: context)
                    .textFormFieldForBirthDay,
                VSpacings.medium,
                MyButtonTheme(
                        onFunction: () {
                          if (formKey.currentState!.validate()) {
                            controller.saveData(
                                idController.text,
                                priceController.text,
                                colorController.text,
                                statusController.text,
                                speciesController.text,
                                sexController.text,
                                birthDayController.text);
                          }
                        },
                        nameButton: 'Done')
                    .outlineButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
