import 'package:flutter/material.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/ui/widgets/translation/language_drop_down.dart';
import 'package:translator_app/ui/widgets/translation/translation_top_bar.dart';

class TranslationScreenBody extends StatelessWidget {
  const TranslationScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TranslationTopBar(),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                // Change language From
                const LanguageDropDown(changeFrom: true),
                Icon(Icons.swap_horiz_rounded, color: AppColors.lightPrimary),
                // Change language To
                const LanguageDropDown(changeFrom: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
