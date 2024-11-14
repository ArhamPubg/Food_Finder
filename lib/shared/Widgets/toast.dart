import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:food_app/shared/constants/config.dart';
import 'package:google_fonts/google_fonts.dart';

class Toast {
  void showCustomToast(BuildContext context, String text) {
    showToast(
      text,
      textStyle: GoogleFonts.cabin(
          textStyle: const TextStyle(
              fontSize: 20,
              color: AppColor.white,
              fontWeight: FontWeight.bold)),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideFromTopFade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 4),
      curve: Curves.bounceIn,
      reverseCurve: Curves.bounceOut,
    );
  }
}
