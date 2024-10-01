import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';

double get defaultPadding => 16;
double get defaultRadius => 10;
Duration get defaultDuration => const Duration(milliseconds: 200);

double get defaultTopPadding => MediaQuery.of(Get.context!).padding.top + defaultPadding;
double get defaultBottomPadding => MediaQuery.of(Get.context!).padding.bottom == 0.0 ? defaultPadding : MediaQuery.of(Get.context!).padding.bottom + 8;

List<BoxShadow> get appBoxShadow => [
      BoxShadow(
        color: AppColors.black.withOpacity(.1),
        blurRadius: 5,
        spreadRadius: 0,
        offset: const Offset(0, 0),
      )
    ];
