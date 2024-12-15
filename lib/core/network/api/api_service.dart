import 'dart:async';

import 'package:dio/dio.dart';
import 'package:the_movie/core/network/api/dio_instance.dart';
import 'package:the_movie/core/network/api/extensions/map_error_extension.dart';
import 'package:the_movie/core/network/api/refresh_token_service.dart';
import 'package:the_movie/core/network/api_config.dart';
import 'package:the_movie/core/utils/local_storage_data_source/secure_keys.dart';
import 'package:the_movie/core/utils/local_storage_data_source/secure_storage_service.dart';

ApiService getApiService() {
  return ApiService(dio: dio());
}

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  Future<Response> getData(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      bool sendToken = false,
      bool ignoreSessionExpire = false}) async {
    return await _errorHandler(() async {
      if (sendToken) {
        options = await getUserToken(options);
      }
      final res = await dio.get(
        path,
        queryParameters: queryParameters,
        //Every request can pass an Options object which will be merged with Dio.options
        options: options,
        cancelToken: cancelToken,
      );
      return res;
    }, ignoreSessionExpire);
  }

  Future<Response> postData(
      {required String path,
      Map<String, dynamic>? queryParameters,
      dynamic data,
      Options? options,
      CancelToken? cancelToken,
      Function(int, int)? onSendProgress,
      Function(int, int)? onReceiveProgress,
      bool sendToken = false,
      bool ignoreSessionExpire = false}) async {
    return await _errorHandler(() async {
      if (sendToken) {
        options = await getUserToken(options);
      }
      return await dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    }, ignoreSessionExpire);
  }

  Future<Response> fetch({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _errorHandler(
      () async {
        return await dio.post(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response> deleteData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    bool sendToken = false,
  }) async {
    return await _errorHandler(
      () async {
        if (sendToken) {
          options = await getUserToken(options);
        }
        return await dio.delete(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response> putData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _errorHandler(
      () async {
        return await dio.put(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Options?> getUserToken(Options? options) async {
    String? token =
        await SecureStorageService().getPref(key: SecureKeys.accessToken);
    if (options != null && token != null) {
      return options.copyWith(headers: {
        ApiConfig.contentTypeHeaderKey: ApiConfig.applicationJsonContentType,
        ApiConfig.accessToken: token
      });
    } else {
      return options;
    }
  }

  Future<Response> patchData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _errorHandler(
      () async {
        return await dio.patch(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Completer<bool> refreshTokenCompleter = Completer<bool>();
  bool tryingRefresh = false;

  Future<T> _errorHandler<T>(Future<T> Function() body,
      [bool ignoreSessionExpire = false]) async {
    try {
      return await body();
    } catch (e, st) {
      final error = e.mapErrorToServerException();
      if (!ignoreSessionExpire) {
        /// used ignoreSessionExpire to skip the flow when token is expired for mf-kyc campaign flow
        if (error.code == 401) {
          if (tryingRefresh == true) {
            //already trying to refresh wait for it to be refreshed and then check value
            bool didRefreshSuccessfully = await refreshTokenCompleter.future;
            if (didRefreshSuccessfully) {
              //if refreshed , call the body , else earlier api call will logout so no need for else
              return await body();
            }
          }
          //setting the boolean as true before trying refresh
          tryingRefresh = true;
          final value = await RefreshTokenService.callRefreshTokenAPI(dio);
          //after trying refresh setting the boolean as false
          tryingRefresh = false;
          //complete the refresh future so that incase other api calls are waiting , they will recall
          refreshTokenCompleter.complete(value);

          //reset the completer so that incase other api calls fail , it will again be available
          Timer(const Duration(seconds: 5), () {
            refreshTokenCompleter = Completer<bool>();
          });
          if (value) {
            return await body();
          } else {
            //do logout
            // GlobalNavigationUtils.logoutCurrentApp();
            throw Error.throwWithStackTrace(error, st);
          }
          /* } else {
          throw Error.throwWithStackTrace(error, st);
        }*/
        } else {
          throw Error.throwWithStackTrace(error, st);
        }
      } else {
        return await body();
      }
    }
  }
}
