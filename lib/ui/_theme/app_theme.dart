import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_theme/color_theme_dark.dart';
import 'color_theme/color_theme_light.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.green),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.cyan,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.red,
      iconTheme: IconThemeData(color: Colors.yellow),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

extension AppThemeExt on ThemeData {
  Color primary() {
    return Get.isDarkMode
        ? ColorThemeDark().primaryColor
        : ColorThemeLight().primaryColor;
  }

  Color primaryText() {
    return Get.isDarkMode
        ? ColorThemeDark().primaryTextColor
        : ColorThemeLight().primaryTextColor;
  }

  Color divider() {
    return Get.isDarkMode
        ? ColorThemeDark().dividerColor
        : ColorThemeLight().dividerColor;
  }

  Color mainColor() {
    return Get.isDarkMode
        ? ColorThemeDark().mainColor
        : ColorThemeLight().mainColor;
  }
  Color secondColor() {
    return Get.isDarkMode
        ? ColorThemeDark().secondColor
        : ColorThemeLight().secondColor;
  }

  Color background1() {
    return Get.isDarkMode
        ? ColorThemeDark().background1
        : ColorThemeLight().background1;
  }
}
