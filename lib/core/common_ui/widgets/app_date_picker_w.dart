import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/widgets/app_dialog.dart';
import 'package:the_movie/core/common_ui/widgets/app_dialog_w.dart';
import 'package:go_router/go_router.dart';

void showDatePickerDialog(BuildContext context,
    {Function(DateTime)? onDateSelect, DateTime? initialDate}) {
  showAppDialog(
    context,
    height: 440,
    width: 600,
    child: AppDatePickerW(
      onDateSelect: onDateSelect,
    ),
  );
}

class AppDatePickerW extends StatelessWidget {
  final DateTime? initialDate;
  final Function(DateTime)? onDateSelect;
  const AppDatePickerW({
    super.key,
    this.initialDate,
    this.onDateSelect,
  });

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = initialDate ?? DateTime.now();

    return AppDialogW(
      positiveLabel: AppStrings.ok,
      negativeLabel: AppStrings.cancel,
      showCloseIcon: false,
      onNegativeClick: () {
        context.pop();
      },
      onPositiveClick: () {
        onDateSelect?.call(selectedDate);
        context.pop();
      },
      body: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          // firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          calendarType: CalendarDatePicker2Type.single,
        ),
        value: [DateTime.now()],
        onValueChanged: (selectedDates) {
          if (selectedDates.isNotEmpty) {
            selectedDate = selectedDates.first;
          }
        },
      ),
    );
  }
}
