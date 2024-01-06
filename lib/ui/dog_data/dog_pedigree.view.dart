import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_pedigree.vm.dart';

class DogPedigreeView extends BaseView<DogPedigreeVM> {
  DogInstance? dogDetail;

  DogPedigreeView({
    this.dogDetail,
  }) : super() {
    Get.put(DogPedigreeVM());
    print(dogDetail);
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(dogDetail?.dad ?? 'ยังไม่มีข้อมูล'),
          Text(dogDetail?.mom ?? 'ยังไม่มีข้อมูล')
        ],
      ),
    );
  }
}
