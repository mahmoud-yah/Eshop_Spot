import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
    this.underline = TextDecoration.none,
    Key? key,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        decoration: underline,
        textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
