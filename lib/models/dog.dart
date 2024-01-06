class DogInstance {
  final String? id;
  final String? color;
  final String? birth;
  final String? price;
  final String? sex;
  final String? species;
  final String? status;

  final String? pedigree;
  final String? take;
  final String? out;
  final String? etc;
  final String? mom;
  final String? dad;
  final String? profileImage;
  List<Vaccine>? vaccine;
  List<Photos>? images;
  String docId;

  DogInstance(
    this.docId, {
    this.id,
    this.color,
    this.birth,
    this.price,
    this.sex,
    this.species,
    this.status,
    this.pedigree,
    this.images,
    this.vaccine,
    this.take,
    this.out,
    this.etc,
    this.dad,
    this.mom,
    this.profileImage,
  });
}

class Vaccine {
  String date;
  String images;
  String vaccineType;

  Vaccine({
    required this.date,
    required this.images,
    required this.vaccineType,
  });
}

class Photos {
  String age;
  List images;

  Photos({
    required this.age,
    required this.images,
  });
}
