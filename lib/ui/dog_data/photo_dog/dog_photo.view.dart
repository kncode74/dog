import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/add_photo.view.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/add_photo.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/dog_data/photo_dog/dog_photo.vm.dart';

class DogPhotoView extends BaseView<DogPhotoVM> {
  DogInstance? dogDetail;

  DogPhotoView({
    this.dogDetail,
  }) : super() {
    Get.put(DogPhotoVM());
    print(dogDetail);
  }

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(dogDetail?.profileImage ?? 'No data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            AddPhotoDogView(),
            binding: AddPhotoDogBinding(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
