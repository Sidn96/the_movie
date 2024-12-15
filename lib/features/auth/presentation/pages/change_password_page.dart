import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class ChangePasswordPage extends HookWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppColors.grayLight[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              AppTextField(
                controller: currentPasswordController,
                hintText: AppStrings.currentPassword,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: newPasswordController,
                hintText: AppStrings.newPassword,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              AppElevatedButton(
                text: AppStrings.submit,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
