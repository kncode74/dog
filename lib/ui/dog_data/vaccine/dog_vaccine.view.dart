import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
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

  Widget render(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromRGBO(248, 247, 247, 1),
        body: Center(
            child: ListView.builder(
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
                        DocumentCard(
                          widget: Column(
                            children: [
                              Text(vaccine.vaccine?[0].date ?? ''),
                              Text(vaccine.vaccine?[0].vaccineType ?? ''),
                              Container(
                                height: 150,
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: vaccine.vaccine?[0].images ?? '',
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })),
        floatingActionButton: FloatingActionButton(
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
