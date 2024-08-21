import 'package:flutter/material.dart';
import 'package:translator_app/core/helper/extensions.dart';
import 'package:translator_app/core/theme/app_colors.dart';

import '../../../core/routing/routes.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(Routes.translatorScreen);
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.lightPrimary,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.lightPrimary,
          ),
        ),
      ),
    );
  }
}
