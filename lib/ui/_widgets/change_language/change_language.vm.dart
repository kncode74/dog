import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_controller.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/constant.dart';
import 'package:getx_mvvm_boilerplate/data/preferences/user_preference.dart';
import 'package:getx_mvvm_boilerplate/di/container.dart';
import 'package:getx_mvvm_boilerplate/models/language.dart';

class LanguageBinding extends Bindings {
  void dependencies() {
    Get.lazyPut<LanguageVM>(
      () => LanguageVM(),
      fenix: true,
    );
  }
}

class LanguageVM extends BaseController {
  final Rx<Language> currentLanguage = Language.init(label: 'en').obs;
  final RxList<Language> rxLocaleList = localeList.obs;
  final UserPreference _userPreference = inject<UserPreference>();

  init() async {
    var languageCode = await _userPreference.getLanguageCode();
    if (languageCode == null) {
      currentLanguage.value = rxLocaleList.first;
      return;
    } else {
      currentLanguage.value = rxLocaleList.firstWhere(
          (item) => _toLocale(languageCode).languageCode == item.label);
    }
  }

  Locale _toLocale(String localeString) {
    List<String> splitLanguageCode = localeString.split('-');
    return Locale(splitLanguageCode.first, '');
  }

  onSelectedLocale(BuildContext context, Language locale) async {
    _userPreference.setLanguageCode(locale.label!);
    currentLanguage.value = locale;
    Get.updateLocale(Locale(locale.label!));
  }
}
