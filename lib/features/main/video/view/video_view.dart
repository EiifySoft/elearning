import 'package:elearning/common/style/text_style.dart';
import 'package:flutter/material.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppTextStyle.style20(text: "Video"),
      ),
    );
  }
}
