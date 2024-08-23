import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/data/models/country_data_model.dart';
import 'package:translator_app/logic/translation_cubit.dart';
import 'package:translator_app/logic/translation_state.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key, required this.changeFrom});
  final bool changeFrom;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationCubit, TranslationState>(
      builder: (context, state) {
        var cubit = context.read<TranslationCubit>();
        var selectedCountry =
            changeFrom ? cubit.selectedCountryFrom : cubit.selectedCountryTo;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.lightPrimary,
              width: 0.2,
            ),
          ),
          child: DropdownButton<CountryDataModel>(
            value: selectedCountry,
            underline: const SizedBox(height: 0),
            dropdownColor: AppColors.white,
            hint: Text(
              'Select Language',
              style: AppTextStyles.font13BlackW300,
            ),
            icon: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Icon(Icons.keyboard_arrow_down_rounded,
                  color: AppColors.lightPrimary),
            ),
            elevation: 0,
            items: countries.map(
              (country) {
                return DropdownMenuItem<CountryDataModel>(
                  value: country,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(
                          country.flag,
                        ),
                      ),
                      horizontalSpace(8),
                      Text(
                        country.name,
                        style: AppTextStyles.font13BlackW300.copyWith(
                          color: country.name == selectedCountry?.name
                              ? AppColors.black
                              : AppColors.primary.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
            onChanged: (newValue) {
              changeFrom
                  ? cubit.updateCountryFrom(newValue!)
                  : cubit.updateCountryTo(newValue!);
            },
          ),
        );
      },
    );
  }
}
