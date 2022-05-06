import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#2C6975");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");

  // new colors

  static Color borderColor = HexColor.fromHex("#E2E2E2");
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color primaryLight = HexColor.fromHex("#68B2A0");
  static Color secondry = HexColor.fromHex("#CDE0C9");
  static Color secondryLight = HexColor.fromHex("#E0ECDE");
  static Color black = HexColor.fromHex("#000000"); // black color
  static Color red = HexColor.fromHex("#F44336"); // black color
  static Color blue = HexColor.fromHex("#2196F3"); // blue color
  static Color green = HexColor.fromHex("#43A047"); // green color
  static Color yellow = HexColor.fromHex("#FFEB3B"); // yellow color
  static Color orange = HexColor.fromHex("#FF9800"); // yellow color
  static Color gold = HexColor.fromHex("#F9A825"); // gold
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
