import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/edit_pedigree/edit_pedigree.vm.dart';

class EditPedigreeView extends BaseView<EditPedigreeVM> {
  TextEditingController dadController = TextEditingController();
  TextEditingController momController = TextEditingController();

  @override
  void onInit() {
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Edit Pedigree').editAppbar,
      body: Obx(
        () {
          dadController = TextEditingController(
              text: controller.dogDetail.value?.dad ?? '');
          momController = TextEditingController(
              text: controller.dogDetail.value?.mom ?? '');
          return SingleChildScrollView(
            child: Column(
              children: [
                TextFormFieldTheme(controller: dadController, labels: 'Id Dad')
                    .defaultTextFormField,
                TextFormFieldTheme(controller: momController, labels: 'Id Mom')
                    .defaultTextFormField,
                ElevatedButton(
                  onPressed: () {
                    controller.updateData(
                      dadController.text,
                      momController.text,
                    );
                  },
                  child: Text('save'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
