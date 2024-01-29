import 'package:cm_mobile/ui/_theme/app_theme.dart';
import 'package:flutter/material.dart';

class IconSize {
  static double get xxSmall => 10.0;

  static double get xSmall => 14.0;

  static double get small => 16.0;

  static double get medium => 18.0;

  static double get large => 24.0;

  static double get xlarge => 30.0;

  static double get xxLarge => 40.0;

  static double get xxxLarge => 64.0;
}

class Dimen {
  static double get xxxxxSmall => 4.0;

  static double get xxxxSmall => 6.0;

  static double get xxxSmall => 8.0;

  static double get xxSmall => 10.0;

  static double get xSmall => 12.0;

  static double get small => 14.0;

  static double get medium => 20.0;

  static double get large => 30.0;
}

class AppBorderRadius {
  static BorderRadius get zero => BorderRadius.circular(0.0);

  static BorderRadius get xxxSmall => BorderRadius.circular(Dimen.xxxSmall);

  static BorderRadius get xxSmall => BorderRadius.circular(Dimen.xxSmall);

  static BorderRadius get large => BorderRadius.circular(Dimen.large);
}

class AppDecoration {
  static BoxDecoration get decoration1 => BoxDecoration(
        borderRadius: AppBorderRadius.xxSmall,
        border: Border.all(
          width: 1.5,
          color: ThemeData().background3(),
        ),
      );

  static BoxDecoration get decoration2 => BoxDecoration(
        color: ThemeData().background(),
        borderRadius: AppBorderRadius.xxSmall,
        boxShadow: [
          AppBorderShadow.shadow2,
        ],
      );

  static BoxDecoration get fileDecoration => BoxDecoration(
        borderRadius: AppBorderRadius.xxSmall,
        color: ThemeData().blue().withOpacity(0.15),
      );

  static BoxDecoration get card => BoxDecoration(
        color: ThemeData().background(),
        borderRadius: AppBorderRadius.xxSmall,
        boxShadow: [
          AppBorderShadow.shadow1,
        ],
      );
}

class AppBorderShadow {
  static get shadow1 => BoxShadow(
        color: ThemeData().border(),
        spreadRadius: 2,
        blurRadius: 4,
      );

  static get shadow2 => BoxShadow(
        color: ThemeData().border(),
        spreadRadius: 1,
        blurRadius: 0,
      );
}

class Spacing {
  // === All ===
  static get allXXXXXSmall => EdgeInsets.all(Dimen.xxxxxSmall);

  static get allXXXXSmall => EdgeInsets.all(Dimen.xxxxSmall);

  static get allXXXSmall => EdgeInsets.all(Dimen.xxxSmall);

  static get allXXSmall => EdgeInsets.all(Dimen.xxSmall);

  static get allXSmall => EdgeInsets.all(Dimen.xSmall);

  static get allSmall => EdgeInsets.all(Dimen.small);

  static get allMedium => EdgeInsets.all(Dimen.medium);

  static get allLarge => EdgeInsets.all(Dimen.large);

  // === Top ===
  static get xxxxxSmallT => EdgeInsets.only(top: Dimen.xxxxxSmall);

  static get xxxxSmallT => EdgeInsets.only(top: Dimen.xxxxSmall);

  static get xxxSmallT => EdgeInsets.only(top: Dimen.xxxSmall);

  static get xxSmallT => EdgeInsets.only(top: Dimen.xxSmall);

  static get xSmallT => EdgeInsets.only(top: Dimen.xxSmall);

  static get smallT => EdgeInsets.only(top: Dimen.small);

  static get mediumT => EdgeInsets.only(top: Dimen.medium);

  static get largeT => EdgeInsets.only(top: Dimen.large);

  // === Bottom ===
  static get xxxxxSmallB => EdgeInsets.only(bottom: Dimen.xxxxxSmall);

  static get xxxxSmallB => EdgeInsets.only(bottom: Dimen.xxxxSmall);

  static get xxxSmallB => EdgeInsets.only(bottom: Dimen.xxxSmall);

  static get xxSmallB => EdgeInsets.only(bottom: Dimen.xxSmall);

  static get xSmallB => EdgeInsets.only(bottom: Dimen.xxSmall);

  static get smallB => EdgeInsets.only(bottom: Dimen.small);

  static get mediumB => EdgeInsets.only(bottom: Dimen.medium);

  static get largeB => EdgeInsets.only(bottom: Dimen.large);

  // === Left ===
  static get xxxxxSmallL => EdgeInsets.only(left: Dimen.xxxxxSmall);

  static get xxxxSmallL => EdgeInsets.only(left: Dimen.xxxxSmall);

  static get xxxSmallL => EdgeInsets.only(left: Dimen.xxxSmall);

  static get xxSmallL => EdgeInsets.only(left: Dimen.xxSmall);

  static get xSmallL => EdgeInsets.only(left: Dimen.xSmall);

  static get smallL => EdgeInsets.only(left: Dimen.small);

  static get mediumL => EdgeInsets.only(left: Dimen.medium);

  static get largeL => EdgeInsets.only(left: Dimen.large);

  // === Right ===
  static get xxxxxSmallR => EdgeInsets.only(right: Dimen.xxxxxSmall);

  static get xxxxSmallR => EdgeInsets.only(right: Dimen.xxxxSmall);

  static get xxxSmallR => EdgeInsets.only(right: Dimen.xxxSmall);

  static get xxSmallR => EdgeInsets.only(right: Dimen.xxxSmall);

  static get xSmallR => EdgeInsets.only(right: Dimen.xxSmall);

  static get smallR => EdgeInsets.only(right: Dimen.small);

  static get mediumR => EdgeInsets.only(right: Dimen.medium);

  static get largeR => EdgeInsets.only(right: Dimen.large);

  // === Custom ===
  static get searchBar => EdgeInsets.only(
        left: Dimen.medium,
        right: Dimen.medium,
        top: Dimen.small,
      );
}

class VSpacings {
  static SizedBox get xxxxxSmall => SizedBox(height: Dimen.xxxxxSmall);

  static SizedBox get xxxxSmall => SizedBox(height: Dimen.xxxxSmall);

  static SizedBox get xxxSmall => SizedBox(height: Dimen.xxxSmall);

  static SizedBox get xxSmall => SizedBox(height: Dimen.xxSmall);

  static SizedBox get xSmall => SizedBox(height: Dimen.xSmall);

  static SizedBox get small => SizedBox(height: Dimen.small);

  static SizedBox get medium => SizedBox(height: Dimen.medium);

  static SizedBox get large => SizedBox(height: Dimen.large);
}

class HSpacings {
  static SizedBox get xxxxxSmall => SizedBox(width: Dimen.xxxxxSmall);

  static SizedBox get xxxxSmall => SizedBox(width: Dimen.xxxxSmall);

  static SizedBox get xxxSmall => SizedBox(width: Dimen.xxxSmall);

  static SizedBox get xxSmall => SizedBox(width: Dimen.xxSmall);

  static SizedBox get xSmall => SizedBox(width: Dimen.xSmall);

  static SizedBox get small => SizedBox(width: Dimen.small);

  static SizedBox get medium => SizedBox(width: Dimen.medium);

  static SizedBox get large => SizedBox(width: Dimen.large);
}

const int kToolbarHeight = 145;
