import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/core/common_ui/widgets/app_label_textfield_w.dart';

class AppPasswordField extends HookWidget {
  final TextEditingController controller;
  final String headerText;
  final String hintText;
  final bool enabled;
  final String? Function(String?)? validator;

  const AppPasswordField({
    super.key,
    required this.controller,
    required this.headerText,
    required this.hintText,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isPasswordVisible = useState(false);

    return LabelTextFieldW(
      controller: controller,
      headerText: headerText,
      hintText: hintText,
      obscureText: !isPasswordVisible.value,
      validator: validator,
      prefixIcon: Icon(
        Icons.key,
        color: const Color(0xff737373).withOpacity(0.3),
        size: 21,
      ),
      suffixIcon: GestureDetector(
        onTap: () => isPasswordVisible.value = !isPasswordVisible.value,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Icon(
            isPasswordVisible.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xff737373).withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
