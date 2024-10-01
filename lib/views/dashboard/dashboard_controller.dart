import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/core/utils/app_snack_bar.dart';
import 'package:task_app/data/models/image_model.dart';
import 'package:task_app/data/repository/image_repository.dart';

import '../../data/services/client/base_response.dart';
import '../../data/services/client/result.dart';

class DashboardController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxList<ImageModel> imageList = <ImageModel>[].obs;
  ImageRepository imageRepository = ImageRepository();

  RxInt currentPage = 1.obs;
  RxBool isFetching = false.obs;
  RxBool pageLoader = false.obs;

  /// Get Image List for API
  Future<void> fetchImageList() async {
    isFetching(true);

    Result<BaseResponse, String> result = await imageRepository.fetch();

    result.when(
      (value) {
        if (currentPage.value == 1) {
          imageList.clear();
        }
        List<ImageModel> list = (value.hits as List).map((e) => ImageModel.fromJson(e)).toList();
        imageList.addAll(list);
      },
      (error) => AppSnackBar.error(message: error),
    );

    isFetching(false);
  }

  /// Get Pagination Image List for API
  Future<void> fetchPagination() async {
    pageLoader(true);

    Result<BaseResponse, String> result = await imageRepository.fetch(
      page: currentPage.value,
      perPage: 40,
    );

    pageLoader(false);

    return result.when(
      (value) {
        List<ImageModel> list = (value.hits as List).map((e) => ImageModel.fromJson(e)).toList();

        if (list.isEmpty) {
          scrollController.dispose();
        } else {
          imageList.addAll(list);
        }
      },
      (error) => AppSnackBar.error(message: error),
    );
  }

  /// Pagination Listener Api
  void postPaginationFunction() {
    scrollController.addListener(() {
      var nextPageTrigger = 0.80 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        if (isFetching.isFalse) {
          currentPage++;
          fetchPagination();
        }
      }
    });
  }

  @override
  void onInit() {
    fetchImageList();
    postPaginationFunction();
    super.onInit();
  }
}
