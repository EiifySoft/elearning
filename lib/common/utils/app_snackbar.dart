import 'package:elearning/common/colors/colors.dart';
import 'package:elearning/common/style/text_style.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static showSnackBar({BuildContext? context, required String content}) async {
    return ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        content: AppTextStyle.style16(
          text: content.toString(),
          color: AppColors.lightPinkColor,
        ),
        backgroundColor: AppColors.darkBlackColor,
        dismissDirection: DismissDirection.vertical,
        action: SnackBarAction(
          label: "Cancel",
          onPressed: () {},
        ),
      ),
    );
  }
}
