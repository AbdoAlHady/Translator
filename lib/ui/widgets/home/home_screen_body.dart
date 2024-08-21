import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/helper/extensions.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/routing/routes.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/utils/app_images.dart';
import 'package:translator_app/ui/widgets/home/arrow_button.dart';
import 'package:translator_app/ui/widgets/home/home_rich_text.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.imagesWorldmap),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 80.h,
          left: 16.w,
          right: 16.w,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Rich Text
              const HomeRichText(),
              verticalSpace(35),
              const ArrowButton(),
            ],
          ),
        ),
      ),
    );
  }
}
