import 'package:dio/dio.dart';
import 'package:the_movie/core/network/api/exceptions/app_exception.dart';

extension MapErrorExtension on Object {
  ServerException mapErrorToServerException() {
    final error = this;

    if (error is DioError) {
      return error.dioToServerException();
    }

    return ServerException(
        type: ServerExceptionType.unknown,
        message: error.toString(),
        fullErrorResponse: this);
  }
}

extension _DioErrorExtension on DioError {
  ServerException dioToServerException() {
    final statusCode = response?.statusCode;
    final message = error?.toString() ?? '';

    switch (type) {
      case DioErrorType.badResponse:
        switch (statusCode) {
          //400 is our business logic errors code.
          //It's handled by error interceptors of each API.
          case 400:
            return ServerException(
                type: ServerExceptionType.general,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 401:
            return ServerException(
                type: ServerExceptionType.unauthorized,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 403:
            return ServerException(
                type: ServerExceptionType.forbidden,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 404:
          case 405:
          case 501:
            return ServerException(
                type: ServerExceptionType.notFound,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 409:
            return ServerException(
                type: ServerExceptionType.conflict,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 500:
          case 502:
            return ServerException(
                type: ServerExceptionType.internal,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          case 503:
            return ServerException(
                type: ServerExceptionType.serviceUnavailable,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
          default:
            return ServerException(
                type: ServerExceptionType.unknown,
                message: message,
                code: statusCode,
                fullErrorResponse: this);
        }

      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ServerException(
            type: ServerExceptionType.timeOut,
            message: message,
            code: 408,
            fullErrorResponse: this);

      case DioErrorType.connectionError:
        return ServerException(
            type: ServerExceptionType.noInternet,
            message: message,
            code: 101,
            fullErrorResponse: this);

      case DioErrorType.badCertificate:
        return ServerException(
            type: ServerExceptionType.unknown,
            message: message,
            code: statusCode,
            fullErrorResponse: this);

      case DioErrorType.cancel:
      case DioErrorType.unknown:
        return ServerException(
            type: ServerExceptionType.unknown,
            message: message.contains("Failed host lookup")
                ? "No Internet Connection"
                : message,
            code: statusCode,
            fullErrorResponse: this);
    }
  }
}
