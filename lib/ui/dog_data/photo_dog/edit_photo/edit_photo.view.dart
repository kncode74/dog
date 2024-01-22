import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/edit_photo/edit_photo.vm.dart';
import 'package:transparent_image/transparent_image.dart';

class EditPhotoView extends BaseView<EditPhotoVM> {
  @override
  void onInit() {
    controller.init();
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().editAppbar,
      body: Obx(
        () => Column(
          children: [
            GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.dogDetail.value?.images?[0].images.length,
              itemBuilder: (context, index) {
                return index == 0
                    ? Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(2),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: controller
                              .dogDetail.value?.images?[0].images[index]??"",
                          fit: BoxFit.cover,
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
