import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/application/base/base_view.dart';
import 'package:getx_mvvm_boilerplate/commons/constants/i18n.dart';
import 'package:getx_mvvm_boilerplate/commons/utils/string_utils.dart';
import 'package:getx_mvvm_boilerplate/models/language.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/change_language/change_language.vm.dart';
import 'package:getx_mvvm_boilerplate/ui/_widgets/main_app_bar.dart';

class LanguageView extends BaseView<LanguageVM> {
  @override
  void onInit() {
    controller.init();
    super.onInit();
  }

  Widget _content() {
    return Obx(
      () => Column(
        children: controller.rxLocaleList
            .map(
              (lang) => Column(
                children: [
                  RadioListTile(
                    title: Text(
                      lang.label?.getLocaleText() ?? '',
                    ),
                    value: lang,
                    activeColor: controller.currentLanguage.value == lang
                        ? ThemeData().mainColor()
                        : Colors.grey,
                    onChanged: (Language? locale) {
                      if (locale == null) {
                        return;
                      }
                      controller.onSelectedLocale(context!, locale);
                    },
                    groupValue: controller.currentLanguage.value,
                  ),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: ThemeData().divider(),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }

  Widget render(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: i18n.language.tr).defaultAppbar,
      body: _content(),
    );
  }
}
