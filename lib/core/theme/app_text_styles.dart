import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle font32BlackW700 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  static TextStyle font32PinkW700 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
      color: Colors.pink.withOpacity(0.3),
    ),
  );

  static TextStyle font14BlackW700 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );
  static TextStyle font14WhitekW700 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
  );

  static TextStyle font14BlackW300 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
  );
  static TextStyle font13BlackW300 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 13.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
  );

  static TextStyle font12Black = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
    ),
  );

  static TextStyle font16BlackW300 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.black,
    ),
  );
}
