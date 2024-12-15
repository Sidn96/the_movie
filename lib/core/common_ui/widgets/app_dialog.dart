import 'package:flutter/material.dart';
import 'package:the_movie/config/consts/app_colors.dart';
import 'package:the_movie/config/consts/app_radius.dart';

Future<void> showAppDialog(BuildContext context,
    {required Widget child, double? width, double? height}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: width ?? MediaQuery.sizeOf(context).width - 200,
            height: height ?? MediaQuery.sizeOf(context).height - 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppRadius.lg,
            ),
            child: child,
          ),
        ),
      );
    },
  );
}
