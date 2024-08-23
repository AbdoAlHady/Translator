import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/helper/app_loaders.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';

class TranslateToText extends StatefulWidget {
  const TranslateToText({super.key});

  @override
  State<TranslateToText> createState() => _TranslateToTextState();
}

class _TranslateToTextState extends State<TranslateToText> {
  @override
  void dispose() {
    context.read<TranslationCubit>().flutterTts.stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TranslationCubit, TranslationState>(
      listenWhen: (previous, current) =>
          current is SuccessCopyFromClipBoard ||
          current is TranslateTextErrorState,
      buildWhen: (previous, current) =>
          current is TranslateTextLoadingState ||
          current is TranslateTextSuccessState ||
          current is TranslateTextErrorState,
      listener: (context, state) {
        if (state is TranslateTextErrorState) {
          AppSnackBar().showErrorSnackBar(context, state.message);
        }
        if (state is SuccessCopyFromClipBoard) {
          AppSnackBar().showSuccessSnackBar(context, 'Copied to clipboard');
        }
      },
      builder: (context, state) {
        var cubit = context.read<TranslationCubit>();
        if (state is TranslateTextLoadingState) {
          return Center(
            child: Container(
              height: 50.h,
              width: 50.w,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.primary),
              child: const CircularProgressIndicator(
                color: AppColors.white,
              ),
            ),
          );
        } else if (state is TranslateTextErrorState) {
          return Center(
            child: Text(
              'Faild to translate text, please try agin.!',
              style: AppTextStyles.font14BlackW300,
            ),
          );
        }
        return Column(
          crossAxisAlignment: cubit.selectedCountryTo?.name == 'Saudi'
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Text(cubit.translatedText,
                  style: AppTextStyles.font16BlackW300),
            )),
            Container(
              alignment: AlignmentDirectional.topStart,
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
                    onTap: () async {
                      if (cubit.translatedText.isEmpty) return;
                      await cubit.handleVolumSpeak(isFrom: false);
                    },
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
