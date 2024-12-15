import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../config/consts/app_colors.dart';
import '../../../config/consts/app_spacing.dart';
import '../common_ui.dart';

class AppCheckboxButton extends HookWidget {
  final String label;
  final bool isChecked;
  final BoxDecoration? decoration;
  final ShapeBorder checkBoxShape;
  final Color checkedColor;
  final Color uncheckedColor;
  final double size;
  final Function(bool)? onCheckChange;

  const AppCheckboxButton({
    super.key,
    required this.label,
    this.isChecked = false,
    this.decoration,
    this.checkBoxShape = const RoundedRectangleBorder(),
    this.checkedColor = AppColors.brand,
    this.uncheckedColor = AppColors.white,
    this.size = 24.0,
    this.onCheckChange,
  });

  @override
  Widget build(BuildContext context) {
    final checkedState = useState(isChecked);

    useEffect(() {
      onCheckChange?.call(checkedState.value);
      return;
    }, [checkedState]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          checkedState.value = !checkedState.value;
        },
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: decoration ??
              BoxDecoration(
                  border: Border.all(color: checkedColor),
                  borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppCheckbox(
                isChecked: checkedState.value,
                shape: checkBoxShape,
                checkedColor: checkedColor,
                uncheckedColor: uncheckedColor,
                size: size,
                onChanged: (v) {
                  checkedState.value = v;
                },
              ),
              const SizedBox(width: AppSpacing.height5),
              AppText(
                text: label,
                style: AppTextStyle.getH5TextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
