import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:clean_arch_flutter/core/cacheHelper/cache_helper.dart';
import 'package:clean_arch_flutter/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'lang': 'ar',
          'Authorization': CacheHelper.getData(key: EndPoint.token) ?? '',
        },
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = CacheHelper.getData(key: EndPoint.token);
        if (token != null) {
          options.headers['Authorization'] = token;
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        if (error.response != null && error.response?.data != null) {
          errorResponse = error.response!.data['message'];
          print('Error Message: $errorResponse');
        }
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout) {}
        return handler.next(error);
      },
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> requestedBody,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio.post(
      url,
      data: requestedBody,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> requestedBody,
    Map<String, dynamic>? query,
    CancelToken? cancelToken,
  }) async {
    return await dio.put(
      url,
      data: requestedBody,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async {
    return await dio.delete(
      url,
      data: data,
      cancelToken: cancelToken,
    );
  }

  static Future<Response> uploadImage({
    required String url,
    required String imagePath,
    CancelToken? cancelToken,
  }) async {
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imagePath),
    });
    return await dio.patch(
      url,
      data: formData,
      cancelToken: cancelToken,
    );
  }
}
