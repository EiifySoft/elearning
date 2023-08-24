import 'package:elearning/common/colors/colors.dart';
import 'package:elearning/features/main/build_main/build_main.dart';
import 'package:elearning/features/main/build_main/bloc/main_bloc.dart';
import 'package:elearning/features/main/build_main/bloc/main_event.dart';
import 'package:elearning/features/main/build_main/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: BuildMain.views.elementAt(state.currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.darkRedColor,
            unselectedItemColor: AppColors.darkBlackColor.withOpacity(0.5),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColors.lightPinkColor,
            iconSize: 30,
            currentIndex: state.currentIndex,
            onTap: (index) {
              state.currentIndex = index;
              context
                  .read<MainBloc>()
                  .add(CurrentIndexInvent(currentIndex: index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_arrow),
                label: "Video",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "Chat",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
