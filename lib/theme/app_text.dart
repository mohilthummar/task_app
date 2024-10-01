import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

enum TextSize { extraSmall_10, small_12, medium_14, large_16, title_18, titleLarge_20, headline_24, headlineMedium_26 }

enum TextWight { w400, w500, w600 }

class AppText extends StatelessWidget {
  final String text;
  final TextSize? textSize;
  final TextWight? textWight;
  final Color? textColor;
  final bool? multiLine;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const AppText(
    this.text, {
    super.key,
    this.maxLine,
    this.textSize = TextSize.small_12,
    this.textWight = TextWight.w400,
    this.textColor = AppColors.primaryTextColor,
    this.multiLine = false,
    this.textAlign = TextAlign.left,
    this.textDecoration,
  });

  const AppText.multiLine(
    this.text, {
    super.key,
    this.maxLine,
    this.textSize = TextSize.small_12,
    this.textWight = TextWight.w400,
    this.textColor = AppColors.primaryTextColor,
    this.textAlign = TextAlign.left,
    this.textDecoration,
  }) : multiLine = true;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiLine! ? null : maxLine ?? 1,
      textAlign: textAlign,
      overflow: multiLine! ? TextOverflow.visible : TextOverflow.ellipsis,
      style: textStyle(context)!.copyWith(
        color: textColor,
        fontWeight: fontWeight,
        decoration: textDecoration ?? TextDecoration.none,
      ),
    );
  }

  FontWeight? get fontWeight {
    switch (textWight) {
      case TextWight.w400:
        return FontWeight.w400;
      case TextWight.w500:
        return FontWeight.w500;
      case TextWight.w600:
        return FontWeight.w600;
      default:
        return FontWeight.w400;
    }
  }

  TextStyle? textStyle(context) {
    switch (textSize) {
      case TextSize.extraSmall_10:
        return Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10);
      case TextSize.small_12:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12);
      case TextSize.medium_14:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14);
      case TextSize.large_16:
        return Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16);
      case TextSize.title_18:
        return Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18);
      case TextSize.titleLarge_20:
        return Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22);
      case TextSize.headline_24:
        return Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 24);
      case TextSize.headlineMedium_26:
        return Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 26);
      default:
        return Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12);
    }
  }
}
