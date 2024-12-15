import 'package:the_movie/core/formats/date_formats.dart';

extension StringExtension on DateTime? {
  String? get getDateTimeVisualString {
    if (this == null) return null;
    return AppDateFormats.visualDateFormat.format(this!);
  }
}
