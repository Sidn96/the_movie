import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/styles/app_text_style.dart';
import 'package:the_movie/core/common_ui/widgets/app_text.dart';
import 'package:the_movie/core/common_ui/widgets/app_date_picker_w.dart';
import 'package:the_movie/core/extensions/datetime_extensions.dart';

class AppDatePickerFieldW extends HookWidget {
  final String header;
  final double width;
  final Function(DateTime)? onDateChange;
  const AppDatePickerFieldW({
    super.key,
    required this.header,
    this.width = 150,
    this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime?>(null);

    useEffect(() {
      if (selectedDate.value != null) {
        onDateChange?.call(selectedDate.value!);
      }
      return;
    }, [selectedDate]);

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: header,
            style: AppTextStyle.getH5TextStyle(),
          ),
          const SizedBox(height: AppSpacing.height5),
          InkWell(
            onTap: () => _selectDate(
              context,
              selectedDate: selectedDate.value,
              selectedDateNotifier: selectedDate,
            ),
            child: Container(
              padding: const EdgeInsets.all(6.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: AppRadius.lg,
              ),
              child: AppText(
                text: selectedDate.value?.getDateTimeVisualString ??
                    AppStrings.ddmmyy,
                style: AppTextStyle.getH5TextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context,
      {DateTime? selectedDate,
      ValueNotifier<DateTime?>? selectedDateNotifier}) async {
    // Show the calendar date picker dialog
    showDatePickerDialog(
      context,
      initialDate: selectedDate,
      onDateSelect: (v) {
        selectedDateNotifier?.value = v;
      },
    );
  }
}
