import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/utils/app_images.dart';
import 'package:translator_app/ui/widgets/home/arrow_button.dart';
import 'package:translator_app/ui/widgets/home/countries_with_flag_card.dart';
import 'package:translator_app/ui/widgets/home/home_rich_text.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(child: CountriesWithFlagCard()),
                // Rich Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HomeRichText(),
                    verticalSpace(30),
                    const ArrowButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
