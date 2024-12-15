import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class LabelTextFieldW extends StatelessWidget {
  final TextEditingController? controller;
  final String headerText;
  final String? hintText;
  final TextStyle? headerStyle;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const LabelTextFieldW({
    super.key,
    this.controller,
    required this.headerText,
    this.hintText,
    this.headerStyle,
    this.obscureText = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: headerText,
          style: headerStyle ?? AppTextStyle.getH4TextStyle(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: AppSpacing.height5),
        AppTextField(
          controller: controller,
          hintText: hintText,
          obscureText: obscureText,
          enabled: enabled,
          validator: validator,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
