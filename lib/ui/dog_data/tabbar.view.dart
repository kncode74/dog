import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_data.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_pedigree.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/dog_photo.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/tabbar.vm.dart';

class TabBarDogView extends BaseView<TabbarDogVM> {
  @override
  void onInit() {
    controller.init();
    print('object');
  }

  @override
  Widget render(BuildContext context) {
    return Obx(() {
      var dog = controller.dogList.value;
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
          ),
            body: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: dog?.profileImage?.isNotEmpty == true
                        ? NetworkImage(dog?.profileImage ?? '')
                        : null,
                    child: dog?.profileImage?.isEmpty == true
                        ? const Icon(Icons.add_a_photo, size: 40)
                        : null,
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(dog?.id ?? ''),
                        Text(dog?.price ?? ''),
                        Text(dog?.sex ?? ''),
                        Text(dog?.status ?? ''),
                      ],
                    ))
              ],
            ),
            _tabBar(),
            _tabBarView(dog)
          ],
        )),
      );
    });
  }

  Widget _tabBarView(DogInstance? dog) {
    return Expanded(
      child: TabBarView(
        children: [
          DogData(dogDetail: dog),
          DogPhotoView(dogDetail: dog),
          DogData(dogDetail: dog),
          DogPedigreeView(dogDetail: dog)
        ],
      ),
    );
  }

  Widget _tabBar() {
    return const TabBar(tabs: [
      Tab(
        child: Text(
          'ข้อมูลสุนัข',
          style: TextStyle(
              color: Colors.black, fontSize: 10.8, fontWeight: FontWeight.bold),
        ),
      ),
      Tab(
          child: Text(
        'รูปภาพ',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      )),
      Tab(
          child: Text(
        'วัคซีน',
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      )),
      Tab(
        child: Text(
          'Pedigree',
          style: TextStyle(
              color: Colors.black, fontSize: 12.5, fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
