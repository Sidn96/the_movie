import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle getH1TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h1",
        color: color,
        decoration: decoration,
      );

  static TextStyle getH2TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h2",
        color: color,
        decoration: decoration,
      );

  static TextStyle getH3TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h3",
        color: color,
        decoration: decoration,
      );

  static TextStyle getH4TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h4",
        color: color,
        decoration: decoration,
      );

  static TextStyle getH5TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h5",
        color: color,
        decoration: decoration,
      );

  static TextStyle getH6TextStyle({Color? color, TextDecoration? decoration}) =>
      _getHeaderTextStyle(
        header: "h6",
        color: color,
        decoration: decoration,
      );

// Define default font sizes and font weights as constants for maintainability.
  static const double _defaultTitleSize = 24.0;
  static const double _defaultSubtitleSize = 20.0;
  static const double _defaultBodySize = 14.0;

  static const FontWeight _defaultTitleWeight = FontWeight.bold;
  static const FontWeight _defaultSubtitleWeight = FontWeight.w600;
  static const FontWeight _defaultBodyWeight = FontWeight.normal;

  // Standard TextStyle for Title
  static TextStyle getTitleTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _createTextStyle(
      fontSize: _defaultTitleSize,
      fontWeight: _defaultTitleWeight,
      color: color,
      decoration: decoration,
    );
  }

  // Standard TextStyle for Subtitle
  static TextStyle getSubtitleTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _createTextStyle(
      fontSize: _defaultSubtitleSize,
      fontWeight: _defaultSubtitleWeight,
      color: color,
      decoration: decoration,
    );
  }

  // Standard TextStyle for Body
  static TextStyle getBodyTextStyle({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _createTextStyle(
      fontSize: _defaultBodySize,
      fontWeight: _defaultBodyWeight,
      color: color,
      decoration: decoration,
    );
  }

// Convenience function to create TextStyle with common properties (e.g., size, weight, color)
  static TextStyle _createTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  // A single method to handle the text styles for headers (h1 to h6) with optional scaling.
  static TextStyle _getHeaderTextStyle(
      {required String header, Color? color, TextDecoration? decoration}) {
    // Define base sizes for each header
    const Map<String, double> baseSizes = {
      'h1': 32.0,
      'h2': 28.0,
      'h3': 24.0,
      'h4': 20.0,
      'h5': 18.0,
      'h6': 16.0,
    };

    // Get base size for the header (fallback to 'h6' if header is invalid)
    double baseSize = baseSizes[header] ?? baseSizes['h6']!;

    // Determine font weight based on header type
    FontWeight fontWeight;
    if (header == 'h1' || header == 'h2') {
      fontWeight = FontWeight.bold;
    } else if (header == 'h3' || header == 'h4') {
      fontWeight = FontWeight.w600;
    } else {
      fontWeight = FontWeight.normal;
    }

    // Return the styled TextStyle
    return TextStyle(
      fontSize: baseSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }

  static TextStyle getCustomStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      decoration: decoration,
    );
  }
}
