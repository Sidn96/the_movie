import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';

class AppDropdownW<T> extends HookWidget {
  final List<T> items;
  final String hint;
  final T? selectedValue;
  final String Function(T) itemLabelBuilder;
  final Function(T?)? onChanged;
  final double height;
  final double width;

  const AppDropdownW({
    super.key,
    required this.items,
    required this.hint,
    this.selectedValue,
    required this.itemLabelBuilder,
    this.onChanged,
    this.height = 40,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    final selectedState = useState<T?>(selectedValue);

    useEffect(() {
      onChanged?.call(selectedState.value);
      return;
    }, [selectedState.value, items]);

    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(focusColor: AppColors.transparent),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: AppText(
                    text: hint,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.gray,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((T item) => DropdownMenuItem<T>(
                      value: item,
                      child: AppText(
                        text: itemLabelBuilder(item),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: height,
              width: width,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.black,
                ),
                color: AppColors.transparent,
              ),
            ),
            // iconStyleData: const IconStyleData(
            //   icon: Icon(
            //     Icons.arrow_forward_ios_outlined,
            //   ),
            //   iconSize: 14,
            // ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.white,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all(6),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              // height: 40,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
        ),
      ),
    );
  }
}
