import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';

class HomeRichText extends StatelessWidget {
  const HomeRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Translate',
            style: AppTextStyles.font32BlackW700,
          ),
          TextSpan(
            text: ' Every \n',
            style: AppTextStyles.font32PinkW700,
          ),
          TextSpan(
            text: 'Type Word \n',
            style: AppTextStyles.font32BlackW700,
          ),
          WidgetSpan(child: verticalSpace(35)),
          TextSpan(
            text: 'Help you communicate in \n',
            style: AppTextStyles.font14BlakW300,
          ),
          TextSpan(
            text: 'Different Language \n',
            style: AppTextStyles.font14BlakW300,
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        height: 1.5,
      ),
    );
  }
}
