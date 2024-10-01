import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_app/core/errors/error_message.dart';
import 'package:task_app/data/handler/api_url.dart';
import 'package:task_app/data/services/client/base_response.dart';
import 'package:task_app/data/services/client/interceptor.dart';
import 'package:task_app/data/services/client/result.dart';
import 'package:task_app/data/services/connectivity_service.dart';

export 'base_response.dart';

// 200 = success
// 500 = Internal Server Error
// 401 = Unauthorized
// 403 = Forbidden
// 404 = Not Found

enum RequestType { get, post, delete, put, patch }

abstract class ClientService {
  final Dio _dio = Dio();

  Future<Result<BaseResponse<dynamic>, String>> request({
    required RequestType requestType,
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    String url = '${ApiUrls.baseUrl}$path';

    _dio.interceptors.clear();
    _dio.interceptors.addAll([
      AuthInterceptor(),
      if (kDebugMode)
        LogInterceptor(
          request: false,
          requestBody: false,
          requestHeader: false,
          responseBody: false,
          responseHeader: false,
          error: true,
        ),
    ]);

    Response? response;

    try {
      if (await ConnectivityService.isConnected) {
        switch (requestType) {
          // GET
          case RequestType.get:
            response = await _dio.get(url, queryParameters: queryParameters);
            break;

          // POST
          case RequestType.post:
            response = await _dio.post(url, data: data);
            break;

          // PUT
          case RequestType.put:
            response = await _dio.put(url, data: data);
            break;

          // PATCH
          case RequestType.patch:
            response = await _dio.patch(url, data: data);
            break;

          // DELETE
          case RequestType.delete:
            response = await _dio.delete(url);
            break;

          default:
            return throw RequestTypeNotFoundException(
              'The HTTP request mentioned is not found',
            );
        }
        var result = BaseResponse.fromResponse(response.data);

        return Success(result);
      } else {
        return Failure(ErrorMessage.noInternet);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        return Failure(ErrorMessage.tryAgain);
      }

      if (e.response?.statusCode == 422) {
        return Success(BaseResponse.fromResponse(e.response?.data));
      } else if (e.response?.statusCode == 400 || e.response?.statusCode == 404) {
        return Failure(e.response?.data['error'] ?? ErrorMessage.tryAgain);
      } else {
        if (e.response != null && e.response?.data != null) {
          var result = BaseResponse.fromResponse(e.response?.data);
          return Failure(result.hits);
        } else {
          return Failure(ErrorMessage.tryAgain);
        }
      }
    } catch (e) {
      return Failure(ErrorMessage.tryAgain);
    }
  }
}

// Request type not found exception
class RequestTypeNotFoundException implements Exception {
  String cause;
  RequestTypeNotFoundException(this.cause);
}
