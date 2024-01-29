import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/diaLog.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_content.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_widget/general_text_content.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/dog_data.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_dog.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_dog.vm.dart';

class DogData extends BaseView<DogDataViewModel> {
  DogData() : super() {
    Get.put(DogDataViewModel());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().background1(),
      body: SingleChildScrollView(
        child: Obx(
          () => _content(),
        ),
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      child: DocumentCard(
        widget: Column(
          children: [
            DocumentContent(
              title: i18n.personalInformation.tr,
              widgetList: [
                GeneralTextContent(
                  i18n.status,
                  controller.dogDetail.value?.status ?? '',
                ),
                GeneralTextContent(
                  i18n.id,
                  controller.dogDetail.value?.id ?? '',
                ),
                GeneralTextContent(
                  i18n.species,
                  controller.dogDetail.value?.species ?? '',
                ),
                GeneralTextContent(
                  i18n.sex,
                  controller.dogDetail.value?.sex ?? '',
                ),
                GeneralTextContent(
                  i18n.price,
                  controller.dogDetail.value?.price ?? '',
                ),
              ],
            ),
            DocumentContent(
              title: i18n.information.tr,
              widgetList: [
                GeneralTextContent(
                  i18n.birthDay,
                  controller.dogDetail.value?.birth ?? '',
                ),
                GeneralTextContent(
                  i18n.weight,
                  controller.dogDetail.value?.weight ?? '',
                ),
                GeneralTextContent(
                  i18n.height,
                  controller.dogDetail.value?.height ?? '',
                ),
                GeneralTextContent(
                  i18n.color,
                  controller.dogDetail.value?.color ?? '',
                ),
              ],
            ),
            DocumentContent(
              title: '${i18n.take.tr}- ${i18n.out.tr}',
              isLast: true,
              widgetList: [
                GeneralTextContent(
                  i18n.take,
                  controller.dogDetail.value?.take ?? '',
                ),
                GeneralTextContent(
                  i18n.out,
                  controller.dogDetail.value?.out ?? '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
