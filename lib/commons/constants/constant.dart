import 'package:getx_mvvm_boilerplate/models/language.dart';

class ClientKeyPath {
  static const demo = 'demo_client_key';
  static const dev = 'dev_client_key';
  static const devLocal = 'dev_local_client_key';
  static const production = 'production_client_key';
}

class ServerType {
  static const demo = 'Demo';
  static const dev = 'Dev';
  static const devLocal = 'Dev Local';
  static const production = 'Production';
}

class DogDetection {
  static const face = 1;
  static const nose = 2;
}

List<Language> localeList = [
  Language.init(label: 'en', value: 0),
  Language.init(label: 'th', value: 1),
];
