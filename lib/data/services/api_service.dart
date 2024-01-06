import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_mvvm_boilerplate/data/services/base_service/base_service.dart';

import '../../di/container.dart';

class ApiService {
  final BaseService api = inject<BaseService>();

  //call database
  Future<QuerySnapshot<Object?>> getDog() async {
    return await FirebaseFirestore.instance.collection('dog').get();
  }
  Future <DocumentSnapshot<Map<String, dynamic>>> getDetailDog(String dogId) async {
    return await FirebaseFirestore.instance.collection('dog').doc(dogId).get();
  }
}
