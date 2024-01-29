import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/data_dropdown.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/text_form_field.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/edit_vaccine/edit_vaccine.vm.dart';
import 'package:transparent_image/transparent_image.dart';

class EditVaccineView extends BaseView<EditVaccineVM> {
  TextEditingController dateController = TextEditingController();
  TextEditingController vaccineController = TextEditingController();

  @override
  void onInit() {
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Obx(
      () {
        dateController = TextEditingController(
            text: controller.dogDetail.value?.vaccine?[0].date ?? '');
        vaccineController = TextEditingController(
            text: controller.dogDetail.value?.vaccine?[0].vaccineType ?? '');
        return Scaffold(
          appBar: MainAppBar(
            title: 'คร้ังที่ 1 ',
            onTap: () async {
              await controller.addToStore(
                dateController.text,
                vaccineController.text,
              );
            },
            textOnTap: i18n.save.tr,
          ).editAppbar,
          body: Column(
            children: [
              TextFormFieldTheme(controller: dateController)
                  .textFormFieldForBirthDay,
              TextFormFieldTheme(
                controller: vaccineController,
                listForDropdown: ChoiceData.vaccine,
              ).dropdownButtonFormField,
              SizedBox(
                height: 150,
                child: controller.image.value != null
                    ? Image.file(controller.image.value!)
                    : FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: controller.dogDetail.value?.vaccine?[0].images ??
                            '',
                        fit: BoxFit.cover,
                      ),
              ),
              TextButton(
                onPressed: () async {
                  await controller.pickImages();
                },
                child: Text('edit photo'),
              )
            ],
          ),
        );
      },
    );
  }
}
