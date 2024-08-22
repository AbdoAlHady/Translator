import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';

class TranslateFromTextField extends StatefulWidget {
  const TranslateFromTextField({super.key});

  @override
  State<TranslateFromTextField> createState() => _TranslateFromTextFieldState();
}

class _TranslateFromTextFieldState extends State<TranslateFromTextField> {
  @override
  void initState() {
    context.read<TranslationCubit>().translateFromControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    context.read<TranslationCubit>().translateFromController.dispose();
    context.read<TranslationCubit>().debounce!.cancel();
    context.read<TranslationCubit>().flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: context.read<TranslationCubit>().translateFromController,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'Have something to translate...',
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 28.sp, color: AppColors.primary.withOpacity(0.1)),
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        BlocBuilder<TranslationCubit, TranslationState>(
          buildWhen: (previous, current) {
            return previous is TranslationUpdateWordCountState &&
                current is TranslationUpdateWordCountState;
          },
          builder: (context, state) {
            var cubit = context.read<TranslationCubit>();
            return Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${cubit.wordCount}/${cubit.wordLimit} words',
                    style: AppTextStyles.font12Black,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await cubit.handleVolumSpeak();
                    },
                    child: Icon(
                      Icons.volume_up_outlined,
                      color: AppColors.primary.withOpacity(0.8),
                      size: 22,
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
