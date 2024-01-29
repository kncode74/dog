import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/cached_network_image_widget.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_card.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/document_content.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/add_photo/add_photo.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/add_photo/add_photo.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/dog_photo.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/edit_photo/edit_photo.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/edit_photo/edit_photo.vm.dart';
import 'package:transparent_image/transparent_image.dart';

class DogPhotoView extends BaseView<DogPhotoVM> {
  DogPhotoView() {
    Get.put(DogPhotoVM());
  }

  @override
  void onInit() {
    controller.init();
  }

  Widget _content(String age, List image) {
    return DocumentContent(
      title: age,
      widgetList: [
        Card(
          elevation: 0,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: image.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, gridIndex) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: CachedNetworkImageWidget(
                  imageUrl: image[gridIndex],
                  imageDefaultUrl: icon.placeHolder,
                  imageWidgetBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData().background1(),
      body: Obx(
        () => DocumentCard(
          widget: ListView.builder(
            itemCount: controller.dogImagesList.length,
            itemBuilder: (context, index) {
              var dogImages = controller.dogImagesList[index];
              return _content(dogImages.images?[0].age ?? '',
                  dogImages.images?[0].images ?? []);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            AddPhotoDogView(),
            binding: AddPhotoDogBinding(),
            arguments: {'dogId': controller.dogDetail.value?.id ?? ''},
          )?.then((_) => controller.init());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
