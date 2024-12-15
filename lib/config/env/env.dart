// // NOTE: this code is mostly copied from https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
// import 'package:envied/envied.dart';

// part 'env.g.dart';

// @Envied(path: '../../../.env', requireEnvFile: true)
// abstract class Env {
//   @EnviedField(varName: 'BASE_API_URL')
//   static const String baseUrlFromEnv = _Env.baseUrlFromEnv;

//   // static final Environment currentEnvironment = baseUrlFromEnv.contains("dev")
//   //     ? Environment.dev
//   //     : baseUrlFromEnv.contains("staging")
//   //         ? Environment.staging
//   //         : Environment.prod;
// }

// enum Environment { dev, staging, prod }
