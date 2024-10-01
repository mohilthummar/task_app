import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app/core/constants/app_colors.dart';

import '../../theme/app_style.dart';
import '../../theme/app_text.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(defaultPadding),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularLoader(color: Theme.of(context).primaryColor),
                const SizedBox(width: 14),
                const AppText(
                  "Loading...",
                  textSize: TextSize.medium_14,
                  textColor: AppColors.primaryTextColor,
                  textWight: TextWight.w500,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularLoader extends StatelessWidget {
  final Color? color;
  final double? loaderSize;

  const CircularLoader({super.key, this.color, this.loaderSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (loaderSize ?? 22),
      height: (loaderSize ?? 22),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.white),
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
      ),
    );
  }
}
