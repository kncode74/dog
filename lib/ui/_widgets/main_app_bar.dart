import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_boilerplate/assets/r.dart';
import 'package:getx_mvvm_boilerplate/ui/_theme/app_theme.dart';

class MainAppBar {
  final String? title;
  final double? elevation;
  String? images;
  List<Widget>? actions;
  Function()? onTap;
  String? textOnTap;

  MainAppBar({
    this.title,
    this.elevation,
    this.images,
    this.actions,
    this.onTap,
    this.textOnTap,
  });

  TextStyle get colorWhite => const TextStyle(color: Colors.white);

  TextStyle get colorBlack => const TextStyle(color: Colors.black);

  Widget _titleMain(String title) {
    return Text(
      title,
      style: colorWhite,
    );
  }

  Widget _titleDefalt(String title) {
    return Text(
      title,
      style: colorBlack,
    );
  }

  AppBar get detectionAppbar => AppBar(
        centerTitle: true,
        backgroundColor:ThemeData().mainColor(),
        title: _titleMain(title ?? ''),
        iconTheme: const IconThemeData(color: Color.fromRGBO(57, 57, 57, 1)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                images ?? '',
              ),
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );

  AppBar get defaultAppbar => AppBar(
        centerTitle: true,
        backgroundColor: ThemeData().mainColor(),
        title: _titleMain(title ?? ''),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        actions: actions,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );

  AppBar get mainAppbar => AppBar(
        centerTitle: true,
        backgroundColor: ThemeData().mainColor(),
        title: _titleMain(title ?? ''),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        actions: actions,
      );

  AppBar get editAppbar => AppBar(
        centerTitle: true,
        backgroundColor: ThemeData().mainColor(),
        title: _titleMain(title ?? ''),
        actions: [
          TextButton(
            onPressed: onTap,
            child: SvgPicture.asset(icon.save),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );
}
