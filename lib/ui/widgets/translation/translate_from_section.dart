import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';
import 'package:translator_app/ui/widgets/translation/translate_from_text_field.dart';

class TranslateFormSection extends StatelessWidget {
  const TranslateFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      buildWhen: (previous, current) {
        return current is TranslationChangeLanguagFromState;
      },
      builder: (context, state) {
        var cubit = context.read<TranslationCubit>();
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    style: GoogleFonts.poppins(height: 1.6),
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Translate From ',
                            style: AppTextStyles.font14BlackW300),
                        if (cubit.selectedCountryFrom != null)
                          TextSpan(
                              text: cubit.selectedCountryFrom!.name,
                              style: AppTextStyles.font14BlackW700),
                      ],
                    ),
                  ),
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
              child: const TranslateFromTextField(),
            )
          ],
        );
      },
    );
  }
}
