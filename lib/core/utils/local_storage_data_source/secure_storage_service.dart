import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_movie/core/utils/local_storage_data_source/shared_prefs_keys.dart';
import 'package:the_movie/core/utils/local_storage_data_source/shared_prefs_service.dart';

import 'secure_keys.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: SecureKeys().getAndroidOptions(),
  );
  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  Future<void> deleteAllPref() async {
    try {
      return await SecureStorageService()._secureStorage.deleteAll();
    } catch (e) {
      debugPrint('deleteAllPref() => $e'); // Need to remove this later
    }
  }

  Future<void> deletePref({required String key}) async {
    try {
      var contains =
          await SecureStorageService()._secureStorage.containsKey(key: key);

      if (contains) {
        return await SecureStorageService()._secureStorage.delete(key: key);
      }
    } on PlatformException catch (e) {
      debugPrint('deletePref() => $e'); // Need to remove this later
      await SecureStorageService()._secureStorage.deleteAll();
    }
  }

  Future<bool> getBoolean({required String key, dynamic defaultValue}) async {
    try {
      var contains =
          await SecureStorageService()._secureStorage.containsKey(key: key);

      if (contains) {
        var lb = await SecureStorageService()._secureStorage.read(key: key);
        return lb?.toLowerCase() == 'true';
      }
    } on PlatformException catch (e) {
      debugPrint('getBoolean() => $e'); // Need to remove this later
      await SecureStorageService().deleteAllPref();
    }
    if (defaultValue != null) return defaultValue;
    return false;
  }

  /// helper functions to communicate with secure storage
  Future<String?> getPref({required String key, String? defaultValue}) async {
    try {
      var contains =
          await SecureStorageService()._secureStorage.containsKey(key: key);
      if (contains) {
        return await SecureStorageService()._secureStorage.read(key: key);
      }
    } on PlatformException catch (e) {
      debugPrint('getPref() => $e'); // Need to remove this later
      await SecureStorageService().deleteAllPref();
    } catch (e) {
      return null;
    }
    /*if (defaultValue != null) */
    return defaultValue;
    //return '';
  }

  Future<void> setPref({required String key, required String value}) async {
    try {
      debugPrint('setPref() => saved key $key \t value = $value');
      return await SecureStorageService()
          ._secureStorage
          .write(key: key, value: value);
    } catch (e) {
      debugPrint('setPref() => $e'); // Need to remove this later
    }
  }

  /// use this method in iOS starting
  void checkFirstRunAndClearSecureData() async {
    final SharedPrefsService prefs =
        await SharedPrefsService.getInstance();

    if ((prefs.getBool(SharedPreferencesKeys.isFirstRun)) ?? true) {
      final SecureStorageService storageService = SecureStorageService();
      storageService.deleteAllPref();
      prefs.setBool(SharedPreferencesKeys.isFirstRun, false);
    }
  }
}
