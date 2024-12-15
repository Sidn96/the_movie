import 'package:the_movie/core/formats/date_formats.dart';

extension StringExtension on String? {
  String get toTitleCase {
    if (this == null) return "";
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  DateTime get getDateTimeFromVisualDateFormat {
    if (this == null) return DateTime.now();
    return AppDateFormats.visualDateFormat.parse(this!);
  }
}
