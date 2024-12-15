import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureKeys {
  static final SecureKeys _instance = SecureKeys._internal();
  factory SecureKeys() => _instance;
  SecureKeys._internal();

  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  // IOSOptions getIOSOptions() => IOSOptions(accessibility: IOSAccessibility.first_unlock);

  static const String accessToken = 'access-token';
  static const String refreshToken = 'refresh-token';
}
