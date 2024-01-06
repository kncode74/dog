import 'package:get/get.dart';

class RxNullable<T> {
  Rx<T?> setNull() => Rx<T?>(null);
}