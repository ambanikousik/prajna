import 'package:flutter/material.dart';
import 'data.dart';

mixin C {
  //others colors
  static Color get primaryBlue => const Color(0xFF0079D1);
  static Color get primaryBackgroundColor => const Color(0xFFFFFFFF);
  static Color get elevationShadowColor => Colors.grey.withOpacity(.36);
  static Color get bottomNavigationIconColor => Colors.grey;

  //text colors
  static Color get primaryTextBlue => const Color(0xFF0079D1);
  static Color get secondaryTextBlue => const Color(0xFF2C7198);
  static Color get primaryTextWhite => const Color(0xFFFFFFFF);
  static Color get primaryTextRed => const Color(0xFFEB5757);
  static Color get primaryTextGray => Colors.grey.withOpacity(.7);
  static Color get primaryTextBlack => Colors.black.withOpacity(.72);

  //gradient colors
  static Color get primaryGradientBlue => Color(0xFF0079D1);
  static Color get secondaryGradientBlue => Color(0xFF0064AD);

  //fog hotel gradient
  static List<Color> get bgColor3 => [
    Color.fromRGBO(192, 57, 43, 1),
    Color.fromRGBO(142, 68, 173, 1),
  ];

  static List<Color> get bgColor => [
    Color(0xFF3594DD),
    Color(0xFF0079D1),
    Color(0xFF5036D5),
  ];

  static List<Color> get bgColor1 => [
    multiColor_2,
    multiColor_1,
    multiColor_4,
  ];

  static List<Color> get railColor => [
    Color(0xFF2C7198),
    Color(0xff28292E),
    Color(0xff28292E),
  ];

  static Color get multiColor_1 => Color.fromRGBO(108, 186, 156, 1);
  static Color get multiColor_2 => Color.fromRGBO(2, 168, 166, 1);
  static Color get multiColor_3 => Color.fromRGBO(55, 115, 153, 1);
  static Color get multiColor_4 => Color.fromRGBO(83, 176, 96, 1);
  static Color get multiColor_5 => Color.fromRGBO(9, 186, 186, 1);

  static LinearGradient get railGradient => LinearGradient(
    colors: railColor,
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient get ngRailGradient => LinearGradient(
      colors: bgColor1,
      stops: [0.0, 0.5, 1.0],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp);

  static LinearGradient get bgGradient => LinearGradient(
      colors: bgColor3,
//    stops: [0.0,0.5, 1.0],
      stops: [0.0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      tileMode: TileMode.clamp);
}
