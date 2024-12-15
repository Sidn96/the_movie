import 'package:dio/dio.dart';
import 'package:the_movie/core/network/api_config.dart';
import 'package:the_movie/core/network/dtos/refresh_token_response_dto.dart';
import 'package:the_movie/core/utils/local_storage_data_source/secure_keys.dart';
import 'package:the_movie/core/utils/local_storage_data_source/secure_storage_service.dart';

class RefreshTokenService {
  static Future<bool> callRefreshTokenAPI(Dio dio) async {
    String? token =
        await SecureStorageService().getPref(key: SecureKeys.accessToken);
    String? rToken =
        await SecureStorageService().getPref(key: SecureKeys.refreshToken);
    if (token != null && token != "" && rToken != null && rToken != "") {
      try {
        final refreshTokenResponse = await dio.get("/refreshToken",
            options: Options(headers: {
              ApiConfig.contentTypeHeaderKey:
                  ApiConfig.applicationJsonContentType,
              ApiConfig.accessToken: token,
              ApiConfig.refreshToken: rToken,
            }));
        if (refreshTokenResponse.data != null) {
          final refreshTokenValue =
              RefreshTokenResponseDto.fromJson(refreshTokenResponse.data);
          await SecureStorageService().setPref(
              key: SecureKeys.accessToken,
              value: refreshTokenValue.data.accessToken);
          await SecureStorageService().setPref(
              key: SecureKeys.refreshToken,
              value: refreshTokenValue.data.refreshToken);
          return true;
        } else {
          return false;
        }
      } catch (err) {
        return false;
      }
    } else {
      return false;
    }
  }
}
