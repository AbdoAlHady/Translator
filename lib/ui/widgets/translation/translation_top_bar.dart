import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/theme/app_colors.dart';

class TranslationTopBar extends StatelessWidget {
  const TranslationTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightPrimary,
            width: 0.2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Text Translation',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
          ),
          const Icon(Icons.text_fields, color: AppColors.black, size: 24),
        ],
      ),
    );
  }
}
