import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/ui_constants.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
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

  Widget _header(
    String image,
    String species,
    String status,
    String price,
    String etc,
  ) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          CachedNetworkImageWidget(
            imageUrl: image,
            imageDefaultUrl: icon.placeHolder,
            heightPlace: 80,
            imageWidgetBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: 80,
                backgroundImage: imageProvider,
              );
            },
          ),
          HSpacings.large,
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(species),
                  ],
                ),
                Row(
                  children: [
                    Text(status),
                  ],
                ),
                _priceContent(price),
                Row(
                  children: [
                    Text(etc),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _priceContent(String price) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ThemeData().secondColor(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${i18n.price.tr} $price ${i18n.baht.tr}'),
          ),
        ),
      ],
    );
  }

  Widget _button(DogInstance? dog) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: ThemeData().secondColor(),
            ),
          ),
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
          child: Text(
            i18n.edit.tr,
            style: TextStyle(
              color: ThemeData().secondColor(),
            ),
          ),
        ),
      ],
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
      indicatorColor: ThemeData().mainColor(),
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
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
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

  Widget _filterDog() {
    return DocumentCard(
      widget: Row(
        children: [
          Column(
            children: [
              Text(i18n.recommendedForYou.tr),
              Text(i18n.scrollToSee.tr),
            ],
          ),
          HSpacings.medium,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.filterDog.value.map((dog) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: CachedNetworkImageWidget(
                    imageUrl: dog.profileImage,
                    imageDefaultUrl: icon.placeHolder,
                    imageWidgetBuilder: (context, provider) {
                      return CircleAvatar(
                        radius: 20,
                        backgroundImage: provider,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget render(BuildContext context) {
    return Obx(
      () {
        var dog = controller.dogDetail.value;
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar:
                MainAppBar(title: '${i18n.id.tr} : ${dog?.id}').defaultAppbar,
            body: Column(
              children: [
                _header(
                  dog?.profileImage ?? '',
                  dog?.species ?? '',
                  dog?.status ?? '',
                  dog?.price ?? '',
                  dog?.etc ?? '',
                ),
                _filterDog(),
                _button(dog),
                _tabBar(),
                _tabBarView(dog),
              ],
            ),
          ),
        );
      },
    );
  }
}
