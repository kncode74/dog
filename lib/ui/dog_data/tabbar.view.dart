import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/dog_data.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_profile_dog/edit_profile_dog.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/dog_detail/edit_dog/edit_profile_dog/edit_profile_dog.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/vaccine/dog_vaccine.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/pedigree/dog_pedigree.view.dart';
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
    return Obx(
      () {
        var dog = controller.dogList.value;
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: MainAppBar(title: dog?.id).defaultAppbar,
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
                          Text(dog?.price ?? ''),
                          Text(dog?.sex ?? ''),
                          Text(dog?.status ?? ''),
                          Text(dog?.dad ?? ''),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(
                          EditProfileDogView(),
                          binding: EditProfileDogBinding(),
                          arguments: {'dog': dog},
                        )!
                            .then(
                          (_) => controller.init(),
                        );
                      },
                      child: Text('  edit profile  '),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text('  share profile  '),
                    // )
                  ],
                ),
                _tabBar(),
                _tabBarView(dog),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tabBarView(DogInstance? dog) {
    return Expanded(
      child: TabBarView(
        children: [
          DogData(),
          DogPhotoView(),
          DogVaccineView(),
          DogPedigreeView()
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          child: Text(
            i18n.information.tr,
            style: TextStyle(
                color: Colors.black,
                fontSize: 10.8,
                fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            i18n.photo.tr,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            i18n.vaccine.tr,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Tab(
          child: Text(
            i18n.pedigree.tr,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.5,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
