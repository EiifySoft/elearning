import 'package:elearning/common/colors/colors.dart';
import 'package:elearning/common/sizedbox/index.dart';
import 'package:elearning/common/style/index.dart';
import 'package:elearning/common/widgets/index.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildAppBar(),
          buildGreetinBody(size),
          buildSearchBar(size, context),
          buildColurseSliderBody(
            size,
          ),
        ],
      ),
    );
  }
}

Widget buildAppBar() {
  return SliverAppBar(
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.person),
      ),
    ],
  );
}

Widget buildGreetinBody(Size size) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(size.width / 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyle.style30(
            text: "Hello",
            fontWeight: FontWeight.w600,
            color: AppColors.darkBrownColor.withOpacity(0.5),
          ),
          AppTextStyle.style30(
            text: "Javed Pathan",
            fontWeight: FontWeight.w600,
            color: AppColors.darkBrownColor,
          ),
        ],
      ),
    ),
  );
}

Widget buildSearchBar(Size size, BuildContext context) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(size.width / 30),
      child: Row(
        children: [
          Expanded(
            child: reusableTextField(size, context,
                hintText: "Search courses..", prefixIcon: Icons.search),
          ),
          AppSizedBox.sizedBoxWidth10(),
          IconButton(
            icon: const Icon(
              Icons.equalizer_sharp,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );
}

Widget buildColurseSliderBody(
  Size size,
) {
  return SliverToBoxAdapter(
    child: Column(
      children: [
        SizedBox(
          height: size.width / 1.5,
          child: PageView(
            children: [
              buildCourseSlideView(
                size,
                imagePath:
                    "https://images.unsplash.com/photo-1561736778-92e52a7769ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
                title: "Android app Developement",
                description: "33 Lesson and 33 hours",
              ),
              buildCourseSlideView(
                size,
                imagePath:
                    "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80",
                title: "Data Science",
                description: "10 Lesson and 8 hours",
              ),
              buildCourseSlideView(
                size,
                imagePath:
                    "https://images.unsplash.com/photo-1630681934830-a51136f566e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1383&q=80",
                title: "Indian History",
                description: "5 Lesson and 10 hours",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container buildCourseSlideView(Size size,
    {String? imagePath, String? title, String? description}) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: size.width / 30, vertical: size.width / 15),
    padding: EdgeInsets.all(size.width / 30),
    height: size.width / 1.5,
    width: size.width,
    decoration: BoxDecoration(
      color: AppColors.darkBrownColor,
      borderRadius: BorderRadius.circular(size.width / 40),
      image: DecorationImage(
        image: NetworkImage(imagePath.toString()),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            AppColors.darkBrownColor.withOpacity(0.8), BlendMode.darken),
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.darkBrownColor.withOpacity(0.3),
          blurRadius: 10,
          spreadRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppTextStyle.style22(
          text: title.toString(),
          color: AppColors.darkYellowColor,
          fontWeight: FontWeight.w600,
        ),
        AppTextStyle.style18(
          text: description.toString(),
          color: AppColors.darkYellowColor.withOpacity(0.7),
        ),
      ],
    ),
  );
}
