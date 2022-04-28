import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyColor = Color(0xFF121212);
const Color pinkColor = Color(0xFFff4667);
const Color kColor1 = Color(0xff685959);
const Color kColor2 = Color(0xffADA79B);
const Color kColor3 = Color(0xffA5947F);
const Color kColor4 = Color(0xff738B71);
const Color kColor5 = Color(0xff6D454D);

class ThemesApp{
  static final light = ThemeData(
    primaryColor: mainColor,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyColor,
    backgroundColor: darkGreyColor,
    brightness: Brightness.dark,
  );
}