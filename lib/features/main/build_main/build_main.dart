import 'package:elearning/features/main/chat/view/chat_view.dart';
import 'package:elearning/features/main/home/view/home_view.dart';
import 'package:elearning/features/main/profile/view/profile_view.dart';
import 'package:elearning/features/main/search/view/search_view.dart';
import 'package:elearning/features/main/video/view/video_view.dart';
import 'package:flutter/material.dart';

class BuildMain {
  static List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const VideoView(),
    const ChatView(),
    const ProfileView(),
  ];
}
