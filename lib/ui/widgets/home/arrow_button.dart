import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:translator_app/core/helper/extensions.dart';
import 'package:translator_app/core/routing/routes.dart';
import 'package:translator_app/core/theme/app_colors.dart';

class ArrowButton extends StatefulWidget {
  const ArrowButton({
    super.key,
  });

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

    animation.addListener(() {
      if (animation.value == 1.0) {
        context.pushReplacementNamed(Routes.translatorScreen);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.forward();
      },
      child: AnimatedBuilder(
        builder: (context, child) {
          return CircularPercentIndicator(
            radius: 27.0,
            lineWidth: 5.0,
            percent: animation.value,
            backgroundColor: AppColors.lightPrimary,
            center: Icon(
              Icons.arrow_forward,
              color: animation.value == 1.0
                  ? AppColors.primary
                  : AppColors.lightPrimary,
            ),
            progressColor: AppColors.primary,
          );
        },
        animation: animation,
      ),
    );
  }
}
