import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_style.dart';
import '../../theme/app_text.dart';
import '../constants/app_colors.dart';

class AppSnackBar {
  static void success({required String message}) {
    Get.snackbar(
      "Success!",
      message,
      borderRadius: 10,
      borderWidth: 1.4,
      shouldIconPulse: false,
      colorText: AppColors.black,
      snackStyle: SnackStyle.FLOATING,
      titleText: const SizedBox.shrink(),
      snackPosition: SnackPosition.BOTTOM,
      borderColor: const Color(0xFF32BC32),
      backgroundColor: const Color(0xFFEAF8EA),
      icon: const Icon(CupertinoIcons.check_mark_circled, color: AppColors.black),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding).copyWith(top: defaultPadding / 2, left: 14),
      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2).copyWith(bottom: defaultBottomPadding * 2),
    );
  }

  static void info({required String message, void Function()? onPress, String? buttonText}) {
    Get.snackbar(
      "Info!",
      message,
      borderRadius: 10,
      borderWidth: 1.4,
      shouldIconPulse: false,
      colorText: AppColors.black,
      snackStyle: SnackStyle.FLOATING,
      titleText: const SizedBox.shrink(),
      snackPosition: SnackPosition.BOTTOM,
      borderColor: const Color(0xFF47AFFF),
      backgroundColor: const Color(0xFFEDF7FF),
      icon: const Icon(CupertinoIcons.info, color: AppColors.black),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding).copyWith(top: defaultPadding / 2, left: 14),
      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2).copyWith(bottom: defaultBottomPadding * 2),
      mainButton: onPress == null
          ? null
          : TextButton(
              onPressed: onPress,
              child: AppText(buttonText ?? "Open!", textWight: TextWight.w600),
            ),
    );
  }

  static void error({required String message, void Function()? onPress, String? buttonText}) {
    Get.snackbar(
      "Error!",
      message,
      borderRadius: 10,
      borderWidth: 1.4,
      shouldIconPulse: false,
      colorText: AppColors.black,
      snackStyle: SnackStyle.FLOATING,
      titleText: const SizedBox.shrink(),
      snackPosition: SnackPosition.BOTTOM,
      borderColor: const Color(0xFFFF3A30),
      backgroundColor: const Color(0xFFFFEBEA),
      icon: const Icon(CupertinoIcons.clear_circled, color: AppColors.black),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding).copyWith(top: defaultPadding / 2, left: 14),
      margin: EdgeInsets.symmetric(horizontal: defaultPadding * 2).copyWith(bottom: defaultBottomPadding * 2),
      mainButton: onPress == null
          ? null
          : TextButton(
              onPressed: onPress,
              child: AppText(buttonText ?? "Open!", textWight: TextWight.w600),
            ),
    );
  }
}
