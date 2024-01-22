import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
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

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: controller.dogImagesList.length,
          itemBuilder: (context, index) {
            var dogImages = controller.dogImagesList[index];
            return Card(
              elevation: 0,
              child: InkWell(
                onTap: () {
                  Get.to(
                    EditPhotoView(),
                    binding: EditPhotoBinding(),
                    arguments: {'dog': dogImages},
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          dogImages.images?[0].age ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dogImages.images?[0].images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, gridIndex) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: dogImages.images?[0].images[gridIndex],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
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
