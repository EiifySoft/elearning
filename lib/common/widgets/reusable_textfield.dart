import 'package:elearning/common/colors/colors.dart';
import 'package:flutter/material.dart';

Widget reusableTextField(Size size, BuildContext context,
    {String? hintText,
    IconData? prefixIcon,
    Widget? sufixIcon,
    TextEditingController? controller,
    bool? obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization? textCapitalization = TextCapitalization.none,
    void Function(String)? onChanged}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.darkBrownColor,
      borderRadius: BorderRadius.circular(size.width / 40),
      boxShadow: [
        BoxShadow(
          color: AppColors.darkBrownColor.withOpacity(0.2),
          spreadRadius: 10,
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: onChanged,
      controller: controller,
      style: const TextStyle(color: AppColors.lightPinkColor),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization!,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: AppColors.darkBrownColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
          borderSide: const BorderSide(color: AppColors.darkBrownColor),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.lightPinkColor.withOpacity(0.5)),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.lightPinkColor.withOpacity(0.5),
        ),
        suffixIcon: sufixIcon,
      ),
      obscureText: obscureText!,
    ),
  );
}
