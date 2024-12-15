import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppSearchBarW extends HookWidget {
  final Function(String)? onSearchClick;
  const AppSearchBarW({super.key, this.onSearchClick});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 400,
          child: AppTextField(
            controller: searchController,
            hintText: AppStrings.searchHere,
          ),
        ),
        const SizedBox(width: AppSpacing.height10),
        AppElevatedButton(
          text: AppStrings.search,
          width: 150,
          onPressed: () => onSearchClick?.call(searchController.text),
        ),
      ],
    );
  }
}
