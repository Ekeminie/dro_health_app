import 'package:flutter/material.dart';

class Pallet{
  static Color purple = const Color(0xFF9F5DE2);
  static Color blue = const Color(0xFF5C86CE);
  static Color turquoise = const Color(0xFF0CB8B6);
  static Color purpleGradientRight =const Color(0xFFAD3BFC);
  static Color purpleGradientLeft = const Color(0xFF7A08FA);
  static Color redGradientRight = const Color(0xFFE5366A);
  static Color redGradientLeft = const Color(0xFFFE806F);
  static Color textColorGrey = const Color(0xFF999999);
  static Color appbar = const Color(0xFF8029f6);
  
  static Color grey = const Color(0xFF6A7281);
  static Color white = const Color(0xFFFFFFFF);

  MaterialColor createMaterialColor(Color color) {
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

