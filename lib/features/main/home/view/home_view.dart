import 'package:elearning/common/style/text_style.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextStyle.style20(text: "Home"),
      ),
    );
  }
}
