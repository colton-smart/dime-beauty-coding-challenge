import 'package:flutter/material.dart';

///Palette holds some useful colors for the app
class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xfff5f3f1,
    <int, Color>{
      50: Color(0xffffffff), //10%
      100: Color(0xfffdfdfc), //20%
      200: Color(0xfffbfaf9), //30%
      300: Color(0xfff9f8f7), //40%
      400: Color(0xfff7f5f4), //50%
      500: Color(0xfff5f3f1), //60%
      600: Color(0xffc4c2c1), //70%
      700: Color(0xff939291), //80%
      800: Color(0xff626160), //90%
      900: Color(0xff313130), //100%
    },
  );

  static const Color customBlack = Color.fromRGBO(51, 51, 51, 1);
  static const Color customLightPeach = Color.fromRGBO(237, 223, 203, 1);
  static const Color customLightGray = Color.fromRGBO(243, 243, 243, 1);
}
