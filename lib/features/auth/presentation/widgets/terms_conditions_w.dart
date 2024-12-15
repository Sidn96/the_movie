
import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/core/common_ui/widgets/app_text.dart';
import 'package:the_movie/core/common_ui/styles/app_text_style.dart';
import 'package:the_movie/core/utils/launch_url.dart';

class TermsAndConditionsW extends StatelessWidget {
  const TermsAndConditionsW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        AppText(
          text:
              "By clicking on this your aggring to Hitachi Payment Services ",
          style: AppTextStyle.getH6TextStyle(),
        ),
        GestureDetector(
          onTap: () => launchUrl("https://pub.dev/packages/url_launcher"),
          child: AppText(
            text: "Condition of use",
            style:
                AppTextStyle.getH5TextStyle(color: AppColors.brand[600]),
          ),
        ),
        AppText(
          text: " and ",
          style: AppTextStyle.getH5TextStyle(),
        ),
        GestureDetector(
          onTap: () => launchUrl("https://pub.dev/packages/url_launcher"),
          child: AppText(
            text: "Privacy Notices",
            style:
                AppTextStyle.getH6TextStyle(color: AppColors.brand[600]),
          ),
        )
      ],
    );
  }
}