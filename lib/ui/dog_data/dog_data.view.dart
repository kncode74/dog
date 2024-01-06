import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_data.vm.dart';

class DogData extends BaseView<DogDataViewModel> {
  DogInstance? dogDetail;

  DogData({
     this.dogDetail,
  }) : super() {
    Get.put(DogDataViewModel());
    print(dogDetail);
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 247, 1),
      body:  Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
                      dataprivate('id', dogDetail?.id??''),
                      dataprivate('sex', dogDetail?.sex??''),
                      dataprivate('status', dogDetail?.status??''),
                      dataprivate('species', dogDetail?.species??''),
                      dataprivate('color', dogDetail?.color??''),
                    ],
                  ),
                )
              ],
            ),
          
      
      ),
    );
  }
  Widget dataprivate(String title, String inputtitle) => Container(
    // height: 45,
    decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Color.fromRGBO(159, 203, 114, 1)))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('$title  :   ',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          inputtitle.isNotEmpty
              ? Text(
                  inputtitle,
                  style: const TextStyle(fontSize: 16),
                )
              : const Text(
                  'ยังไม่มีข้อมูล',
                  style: TextStyle(color: Colors.red),
                )
        ],
      ),
    ));
}
