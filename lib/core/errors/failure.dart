import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with API server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode ?? 0, e.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to API server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Oops! There was an error, please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There is a problem with the server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['message']);
    } else if (statusCode == 422) {
      return ServerFailure('Invalid input data, please check and try again');
    } else if (statusCode == 429) {
      return ServerFailure(
          'Too many requests, please slow down and try again later');
    } else if (statusCode == 503) {
      return ServerFailure('Service currently unavailable, please try later');
    } else {
      return ServerFailure('Unexpected error occurred, please try again');
    }
  }
}
