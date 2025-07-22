import 'package:clean_arch_flutter/core/Apis/end_points.dart';
import 'package:clean_arch_flutter/core/errors/failure.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoint.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      dio.options.headers.addAll(headers ?? {});
      return await dio.post(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      dio.options.headers.addAll(headers ?? {});
      return await dio.get(
        url,
        queryParameters: query,
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      dio.options.headers.addAll(headers ?? {});
      return await dio.put(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }
}
