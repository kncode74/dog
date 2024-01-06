import 'package:flutter/material.dart';

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
