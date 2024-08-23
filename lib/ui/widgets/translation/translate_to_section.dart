import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';
import 'package:translator_app/ui/widgets/translation/translate_to_text.dart';

class TranslateToSection extends StatelessWidget {
  const TranslateToSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      buildWhen: (previous, current) {
        return current is TranslationChangeLanguagToState;
      },
      builder: (context, state) {
        var cubit = context.read<TranslationCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              style: GoogleFonts.poppins(height: 1.6),
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Translate To ',
                      style: AppTextStyles.font14BlackW300),
                  if (cubit.selectedCountryTo != null)
                    TextSpan(
                        text: cubit.selectedCountryTo!.name,
                        style: AppTextStyles.font14BlackW700),
                ],
              ),
            ),
            verticalSpace(15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: MediaQuery.sizeOf(context).width,
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.8),
                    width: 0.2,
                  )),
              child: const TranslateToText(),
            )
          ],
        );
      },
    );
  }
}
