import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/data/repositories/api_repository.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';

class DogCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DogCardViewModel>(
      () => DogCardViewModel(),
    );
  }
}

class DogCardViewModel extends BaseController {
  CollectionReference dogCollection =
      FirebaseFirestore.instance.collection('dog');
  RxList<DogInstance> dogList = <DogInstance>[].obs;
  ApiRepository repoFirebase = ApiRepository();
  RxString? selectedSearchType = 'all'.obs;
  RxString searchQuery = ''.obs;

  RxString dadSearchQuery = ''.obs;

  RxString momSearchQuery = ''.obs;

  init() {
    loadDogData();
  }

  loadDogData() async {
    dogList.value = await repoFirebase.dogData();
  }

  void debouncedSearch(String value) {
    if (selectedSearchType?.value == 'all') {
      searchQuery.value = value;
    } else if (selectedSearchType?.value == 'father') {
      dadSearchQuery.value = value;
    } else if (selectedSearchType?.value == 'mother') {
      momSearchQuery.value = value;
    }
  }

  delete(String id) async {
    try {
      await dogCollection.doc(id).delete();
      dogList.refresh();
    } catch (error) {
      print("Error deleting document: $error");
    }
  }
}
