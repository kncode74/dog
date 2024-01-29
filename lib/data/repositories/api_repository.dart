import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_mvvm_boilerplate/models/dog.dart';
import 'package:getx_mvvm_boilerplate/models/farm.dart';
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
        height: dog['height'],
        weight: dog['height'],
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
      height: getDog['height'],
      weight: getDog['height'],
      profileImage: getDog['image_profile'],
    );
  }

  Future<Farm> farmDetail(String email) async {
    DocumentSnapshot<Map<String, dynamic>> getDog =
        await _service.getDetailUser(email);

    return Farm(
        address: getDog['adress'],
        city: getDog['city'],
        district: getDog['district'],
        email: getDog['email'],
        line: getDog['line'],
        facebook: getDog['facebook'],
        etc: getDog['etc'],
        farmName: getDog['farm_name'],
        image: getDog['image'],
        name: getDog['name'],
        phoneNumber: getDog['phone_number'],
        timeOpen: getDog['time_open'],
        timeClose: getDog['time_open']);
  }

  Future<List<DogInstance>> dogImages(String dogId) async {
    QuerySnapshot querySnapshot = await _service.getImagesDog(dogId);
    return querySnapshot.docs.map((image) {
      List<String> imageList = (image['images'] as List<dynamic>)
          .map((dynamic value) => value.toString())
          .toList();
      List<Photos> photoList = [
        Photos(
          age: image['description'],
          images: imageList,
          docId: image.id,
        )
      ];
      return DogInstance(
        image.id,
        images: photoList,
      );
    }).toList();
  }

  Future<List<DogInstance>> dogVaccine(String dogId) async {
    QuerySnapshot querySnapshot = await _service.getVaccineDog(dogId);
    return querySnapshot.docs.map((vaccine) {
      List<Vaccine> vaccineList = [
        Vaccine(
          date: vaccine['date'],
          images: vaccine['image'],
          vaccineType: vaccine['vaccine'],
          docId: vaccine.id,
        ),
      ];
      return DogInstance(vaccine.id, vaccine: vaccineList);
    }).toList();
  }
}
