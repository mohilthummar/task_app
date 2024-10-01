import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_app/core/constants/app_assets.dart';
import 'package:task_app/core/constants/app_colors.dart';
import 'package:task_app/core/constants/app_strings.dart';
import 'package:task_app/core/utils/number_format.dart';
import 'package:task_app/data/models/image_model.dart';
import 'package:task_app/theme/app_style.dart';
import 'package:task_app/views/dashboard/dashboard_controller.dart';
import 'package:task_app/widgets/app_image_view.dart';

import '../../core/utils/app_loader.dart';
import '../../theme/app_text.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        backgroundColor: AppColors.primaryColor,
      ),
      body: dashboardView(),
    );
  }

  /// Dashboard Image Grid View
  Widget dashboardView() {
    return Obx(() {
      if (controller.isFetching.value) {
        return const AppLoader();
      } else {
        if (controller.imageList.isEmpty) {
          return const Center(child: AppText('No Images Found!', textSize: TextSize.title_18));
        } else {
          return GridView.builder(
            itemCount: controller.imageList.length,
            controller: controller.scrollController,
            padding: EdgeInsets.all(defaultPadding),
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 260,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
            ),
            itemBuilder: (context, index) => imageView(controller.imageList[index]),
          );
        }
      }
    });
  }

  /// Image View
  Widget imageView(ImageModel image) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.hintColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          AppImageView(
            imagePath: image.webformatUrl ?? "",
            fit: BoxFit.cover,
            height: Get.width,
            width: Get.height,
          ),
          Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                countView(image: AppAssets.icView, value: (image.views?.numberFormat() ?? "").toString()),
                SizedBox(width: defaultPadding / 2),
                countView(image: AppAssets.icLike, value: (image.likes?.numberFormat() ?? "").toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Image Count View
  Widget countView({String? image, String? value}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(defaultRadius / 2),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            image ?? "",
            width: 14,
            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          AppText(
            value ?? "",
            textWight: TextWight.w500,
            textColor: AppColors.primaryTextColor,
          ),
        ],
      ),
    );
  }
}
