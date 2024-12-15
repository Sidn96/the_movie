import 'package:flutter/material.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppSizedLabelTextFieldW extends StatelessWidget {
  final TextEditingController? controller;
  final String headerText;
  final String? hintText;
  final TextStyle? headerStyle;
  final double width;
  final bool obscureText;
  final bool enabled;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppSizedLabelTextFieldW({
    super.key,
    this.controller,
    required this.headerText,
    this.hintText,
    this.headerStyle,
    this.width = 250,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: LabelTextFieldW(
        controller: controller,
        headerText: headerText,
        hintText: hintText,
        obscureText: obscureText,
        enabled: enabled,
        validator: validator,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
