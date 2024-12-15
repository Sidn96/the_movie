import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_spacing.dart';
import 'package:the_movie/config/consts/app_radius.dart';
import 'package:the_movie/config/consts/app_strings.dart';
import 'package:the_movie/core/common_ui/common_ui.dart';
import 'package:the_movie/core/utils/captcha_generator.dart';
import 'package:the_movie/core/utils/debouncer.dart';

ValueNotifier<bool> isCaptchaValid = ValueNotifier<bool>(false);
ValueNotifier<bool> isCaptchaErrorVisible = ValueNotifier<bool>(false);

void updateCaptchaValidation(bool isValid) {
  isCaptchaValid.value = isValid;
}

void updateCaptchaErrorVisibility(bool visible) {
  isCaptchaErrorVisible.value = visible;
}

class CaptchaW extends HookWidget {
  const CaptchaW({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final randomString = useState("");
    final debouncer = Debouncer(milliseconds: 500);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        randomString.value = generateCaptcha();
      });

      return () {
        debouncer.dispose();
      };
    }, const []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppText(
              text: AppStrings.enterCaptcha,
              style: AppTextStyle.getH4TextStyle(),
            ),
            const SizedBox(width: AppSpacing.height10),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: AppRadius.sm,
              ),
              child: AppText(
                text: randomString.value,
                style: AppTextStyle.getH4TextStyle(),
              ),
            ),
            const SizedBox(width: AppSpacing.height5),
            IconButton(
                onPressed: () => randomString.value = generateCaptcha(),
                icon: const Icon(Icons.refresh)),
          ],
        ),
        AppTextField(
          controller: controller,
          hintText: AppStrings.enterCaptcha,
          onChanged: (s) {
            debouncer
                .run(() => updateCaptchaValidation(s == randomString.value));
          },
        ),
        const SizedBox(height: AppSpacing.height5),
        ValueListenableBuilder(
          valueListenable: isCaptchaErrorVisible,
          builder: (_, val, __) {
            return (val)
                ? AppText(
                    text: AppStrings.enterValidCaptcha,
                    style: AppTextStyle.getH6TextStyle(color: AppColors.error),
                  )
                : const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
