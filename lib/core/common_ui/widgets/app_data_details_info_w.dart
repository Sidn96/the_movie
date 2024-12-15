import 'package:flutter/material.dart';
import 'package:the_movie/core/common_ui/styles/app_text_style.dart';
import 'package:the_movie/core/common_ui/widgets/app_text.dart';

class AppDataDetailsInfoW extends StatelessWidget {
  final String header;
  final String? value;
  const AppDataDetailsInfoW({
    super.key,
    required this.header,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          AppText(
            text: "$header : ",
            style: AppTextStyle.getH4TextStyle(),
          ),
          AppText(
            text: value!,
            style: AppTextStyle.getH5TextStyle(),
          ),
        ],
      ),
    );
  }
}
