import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/ui_constants.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_content.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/add_vaccine/add_vaccine.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/add_vaccine/add_vaccine.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/dog_vaccine.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/edit_vaccine/edit_vaccine.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/edit_vaccine/edit_vaccine.vm.dart';
import 'package:transparent_image/transparent_image.dart';

class DogVaccineView extends BaseView<DogVaccineVM> {
  DogVaccineView() {
    Get.put(DogVaccineVM());
  }

  @override
  void onInit() {
    controller.init();
  }

  Widget _listContent(int index, String date, String vaccine, String image) {
    return DocumentContent(
      title: 'ครั้งที่  $index',
      widgetList: [
        Row(
          children: [
            SvgPicture.asset(
              icon.calendar,
              height: 28,
            ),
            HSpacings.medium,
            Text(date)
          ],
        ),
        VSpacings.xxxxSmall,
        Row(
          children: [
            SvgPicture.asset(
              icon.vaccine,
              height: 28,
            ),
            HSpacings.medium,
            Text(vaccine)
          ],
        ),
        VSpacings.xxSmall,
        CachedNetworkImageWidget(
          imageUrl: image,
          imageDefaultUrl: icon.placeHolder,
          heightPlace: 120,
        ),
      ],
    );
  }

  Widget render(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromRGBO(248, 247, 247, 1),
        body: Center(
          child: DocumentCard(
            widget: ListView.builder(
              itemCount: controller.dogVaccine.length,
              itemBuilder: (context, index) {
                var vaccine = controller.dogVaccine[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      EditVaccineView(),
                      binding: EditVaccineBinding(),
                      arguments: {
                        'dog': vaccine,
                        'id': controller.id,
                      },
                    )!
                        .then(
                      (_) => controller.init(),
                    );
                  },
                  child: Column(
                    children: [
                      _listContent(
                        index + 1,
                        vaccine.vaccine?[0].date ?? '',
                        vaccine.vaccine?[0].vaccineType ?? '',
                        vaccine.vaccine?[0].images ?? '',
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: ThemeData().mainColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            Get.to(
              AddVacineView(),
              binding: AddVaccineBinding(),
              arguments: {'dogId': controller.id ?? ''},
            )?.then((value) => controller.init());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
