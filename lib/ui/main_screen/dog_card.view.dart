import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/add_data/add_data.view.dart';
import 'package:getx_mvvm_boilerplate/ui/add_data/add_data.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_data.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_data.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/main_screen/dog_card.vm.dart';

class DogCard extends BaseView<DogCardViewModel> {
  DogCard() {
    Get.put(DogCardViewModel());
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Data dog', actions: [
        TextButton(
            onPressed: () {
              Get.to(AddDataDog(),
                  binding: AddDataBinding(),
                  arguments: {'sgm': 'dddd'})?.then((_) {
                controller.loadDogData();
              });
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ))
      ]).defaultAppbar,
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.dogList.length,
          itemBuilder: (context, index) {
            var dog = controller.dogList[index];
            return InkWell(
              onTap: () async {
                await Get.to(
                  () => TabBarDogView(),
                  binding: TabBarDogBinding(),
                  arguments: {"dogId": dog.docId},
                );
              },
              child: _listDog(
                dog.profileImage ?? '',
                dog.id,
                dog.status,
                dog.species,
                dog.sex,
              ),
            );
          },
        );
      }),
    );
  }

  Widget _listDog(
      String image, String? id, String? status, String? species, String? sex) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: image.isNotEmpty == true ? NetworkImage(image) : null,
        child: image.isEmpty == true
            ? const Icon(Icons.add_a_photo, size: 40)
            : null,
      ),
      title: Text('$id : $status'),
      subtitle: Text('$species , $sex'),
      trailing: InkWell(
          onTap: () async {
            await controller.delete(id!)?.then(
              (_) {
                controller.loadDogData();
              },
            );
            print(id);
          },
          child: const Icon(Icons.delete)),
    );
  }
}
