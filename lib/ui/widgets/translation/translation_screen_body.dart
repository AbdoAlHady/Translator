import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';

import 'package:translator_app/ui/widgets/translation/language_selection_section.dart';
import 'package:translator_app/ui/widgets/translation/translate_from_section.dart';
import 'package:translator_app/ui/widgets/translation/translate_to_section.dart';
import 'package:translator_app/ui/widgets/translation/translation_top_bar.dart';

class TranslationScreenBody extends StatelessWidget {
  const TranslationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TranslationTopBar(),
          const LanguageSelectionSection(),
          const TranslateFormSection(),
          verticalSpace(10),
          const TranslateToSection(),
          verticalSpace(20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('Submit', style: AppTextStyles.font14WhitekW700),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
