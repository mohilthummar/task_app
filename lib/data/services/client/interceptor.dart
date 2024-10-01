import 'package:dio/dio.dart';

import '../../../core/utils/preferences.dart';
import 'header_builder.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);

    String? token = Preferences.token;

    if (token != null) {
      options.headers = HeaderBuilder().setBearerToken(token).build();
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.response?.statusCode == 401) {
      // Get.offAllNamed(RoutesName.splashView);
    }
  }
}
