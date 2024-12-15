import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

PrettyDioLogger getPrettyLogger() {
  return PrettyDioLogger(
    request: true,
    requestBody: true,
    requestHeader: true,
    responseBody: true,
    responseHeader: true,
    logPrint: (log) {
      return debugPrint(log as String);
    },
  );
}
