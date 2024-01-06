import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:tflite/tflite.dart';

import '../../di/container.dart';
import '../services/api_service.dart';

class ApiRepository {
  final ApiService _service = inject<ApiService>();

  Future<List<DogInstance>> dogData() async {
    QuerySnapshot querySnapshot = await _service.getDog();
    return querySnapshot.docs.map((dog) {
      return DogInstance(
        dog.id,
        id: dog['id'],
        color: dog['color'],
        birth: dog['birth_day'],
        price: dog['price'],
        sex: dog['sex'],
        species: dog['species'],
        status: dog['status'],
        pedigree: dog['pedigree'],
        // imges: dog['images'],
        // vaccine: dog['vaccine'],
        take: dog['take'],
        out: dog['out'],
        etc: dog['etc'],
        dad: dog['dad'],
        mom: dog['mom'],
        profileImage: dog['image_profile'],
      );
    }).toList();
  }

  Future<DogInstance> dogDetailData(String dogId) async {
    DocumentSnapshot<Map<String, dynamic>> getDog =
        await _service.getDetailDog(dogId);

    return DogInstance(
      getDog.id,
      id: getDog['id'],
      color: getDog['color'],
      birth: getDog['birth_day'],
      price: getDog['price'],
      sex: getDog['sex'],
      species: getDog['species'],
      status: getDog['status'],
      pedigree: getDog['pedigree'],
      // imges: dog['images'],
      // vaccine: dog['vaccine'],
      take: getDog['take'],
      out: getDog['out'],
      etc: getDog['etc'],
      dad: getDog['dad'],
      mom: getDog['mom'],
      profileImage: getDog['image_profile'],
    );
  }
}
