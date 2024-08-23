import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/ui/widgets/translation/language_drop_down.dart';

class LanguageSelectionSection extends StatelessWidget {
  const LanguageSelectionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Change language From
          const LanguageDropDown(changeFrom: true),
          Icon(Icons.swap_horiz_rounded, color: AppColors.lightPrimary),
          // Change language To
          const LanguageDropDown(changeFrom: false),
        ],
      ),
    );
  }
}
