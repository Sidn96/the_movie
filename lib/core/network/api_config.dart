// import 'package:the_movie/config/env/env.dart' as env;

abstract class ApiConfig {
  // static String baseUrl = env.Env.baseUrlFromEnv;
  static String baseUrl = "https://api.themoviedb.org";

  static const Duration connectTimeout = Duration(seconds: 120);
  static const Duration receiveTimeout = Duration(seconds: 120);

  static const contentTypeHeaderKey = 'Content-Type';
  static const applicationJsonContentType = 'application/json';
  static const multipartFormDataContentType = 'multipart/form-data';
  static const accessToken = 'access_token';
  static const refreshToken = 'refresh_token';
}
