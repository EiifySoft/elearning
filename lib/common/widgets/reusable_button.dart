import 'package:elearning/common/colors/colors.dart';
import 'package:elearning/common/style/text_style.dart';
import 'package:flutter/material.dart';

Widget reusableElevatedButton(Size size,
    {required VoidCallback onPressed,
    required String lable,
    Color backgroundColor = AppColors.darkBlackColor,
    Color lableColor = AppColors.lightPinkColor}) {
  return Container(
    height: size.width / 7,
    width: size.width,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size.width / 40),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ]),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 2,
        shadowColor: backgroundColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
        ),
      ),
      child: AppTextStyle.style18(
        text: lable,
        color: lableColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
