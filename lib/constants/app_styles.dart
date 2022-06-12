import 'package:flutter/material.dart';

// https://coolors.co/0d3b66-faf0ca-f4d35e-ee964b-f95738
class AppStyles{
  static const TextStyle kDarkTextStyle = TextStyle(
    color: kDefaultDarkColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle kLightTextStyle = TextStyle(
    color: kDefaultLightColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle kLightTextStyleItalic = TextStyle(
    color: kDefaultLightColor,
    fontSize: 13,
    fontWeight: FontWeight.w300,
    // fontStyle: FontStyle.italic
  );

  static const TextStyle kPrimaryTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle kHeadingTextStyle = TextStyle(
    color: kDefaultLightColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle kBigTitleTextStyle = TextStyle(
    color: kPrimaryColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );


  static const Color kDefaultDarkColor = Color(0xFF27272B);
  static const Color kDefaultLightColor = Color(0xFFe0f7fa);
  static const Color kPrimaryColor = Color(0xFF091015);
  static const Color kSecondaryColor = Color(0xFF0D1A28);



  //https://medium.com/@filipvk/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}