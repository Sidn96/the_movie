import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final ShapeBorder shape;
  final Color checkedColor;
  final Color uncheckedColor;
  final double size;

  const AppCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.shape = const RoundedRectangleBorder(),
    this.checkedColor = AppColors.brand,
    this.uncheckedColor = AppColors.white,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () => onChanged(!isChecked),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isChecked ? checkedColor : uncheckedColor,
            border: Border.all(
              color: isChecked ? checkedColor : AppColors.black,
              width: 1.0,
            ),
          ),
          child: isChecked
              ? Center(
                  child: Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: size * 0.8,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
