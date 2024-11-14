import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final double size;

  const TextWidget({
    super.key,
    required this.size,
    required this.color,
    required this.fontWeight,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.cabin(
          textStyle: TextStyle(
              letterSpacing: 0,
              fontWeight: fontWeight,
              color: color,
              fontSize: size)),
    );
  }
}
