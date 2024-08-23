import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/core/helper/spacing.dart';
import 'package:translator_app/core/theme/app_colors.dart';
import 'package:translator_app/core/theme/app_text_styles.dart';
import 'package:translator_app/data/models/country_data_model.dart';

class CountriesWithFlagCard extends StatefulWidget {
  const CountriesWithFlagCard({super.key});

  @override
  State<CountriesWithFlagCard> createState() => _CountriesWithFlagCardState();
}

class _CountriesWithFlagCardState extends State<CountriesWithFlagCard> {
  // Random oblect to generate random numbers
  final Random random = Random();

  // variable to store the the selected country and background
  CountryDataModel? selectedCountry;
  Color? backgroundColor;

  void _randomCountry() {
    setState(() {
      // generate random number between 0 and 1
      final int randomIndex = random.nextInt(countries.length - 1);
      // set the selected country to the random country
      selectedCountry = countries[randomIndex];
      // set the background color to the random color
      backgroundColor =
          Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  void initState() {
    _randomCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _randomCountry();
      },
      child: Wrap(
        spacing: 8.0.w,
        runSpacing: 8.0.h,
        children: countries.map((country) {
          bool isSelected = selectedCountry!.name == country.name;
          return Card(
            elevation: 4.0,
            color: isSelected ? backgroundColor : AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? Colors.transparent : AppColors.lightPrimary,
                width: 0.4,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: 145.w,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    country.flag,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                  horizontalSpace(8),
                  Text(
                    country.name,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.font14BlackW300.copyWith(
                      color: isSelected ? AppColors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
