import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';

class TranslateToText extends StatelessWidget {
  const TranslateToText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslationCubit, TranslationState>(
      listenWhen: (previous, current) => current is SuccessCopyFromClipBoard,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Copied to clipboard'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      builder: (context, state) {
        var cubit = context.read<TranslationCubit>();
        return Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Text(cubit.translateText,
                  style: AppTextStyles.font16BlackW300),
            )),
            Container(
              padding: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.primary.withOpacity(0.8),
                    width: 0.2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      await cubit.copyFromClipBoard();
                    },
                    child: Icon(Icons.copy_all_outlined,
                        color: AppColors.primary.withOpacity(0.8), size: 22),
                  ),
                  horizontalSpace(10),
                  GestureDetector(
                    onTap: () async {},
                    child: Icon(
                      Icons.volume_up_outlined,
                      color: AppColors.primary.withOpacity(0.8),
                      size: 22,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
