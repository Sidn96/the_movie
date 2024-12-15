import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class ToastService {
  // Show success toast
  static void showSuccess(String message) {
    _showToast(message, Colors.green, webBgColor: "#4CAF50");
  }

  // Show error toast
  static void showError(String message) {
    _showToast(message, Colors.red, webBgColor: "#F44336");
  }

  // Show warning toast
  static void showWarning(String message) {
    _showToast(message, Colors.orange, webBgColor: "#EF6C00");
  }

  // Private method to show a toast with a specified background color
  static void _showToast(String message, Color backgroundColor,
      {String? webBgColor}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      webPosition: "center",
      webBgColor: webBgColor ?? "#4CAF50",
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
