import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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

  static TextStyle font14BlakW300 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
  );
}
