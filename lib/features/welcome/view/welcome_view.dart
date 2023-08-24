import 'package:dots_indicator/dots_indicator.dart';
import 'package:elearning/common/colors/colors.dart';
import 'package:elearning/common/services/storage_service.dart';
import 'package:elearning/common/style/text_style.dart';
import 'package:elearning/common/widgets/reusable_button.dart';
import 'package:elearning/features/welcome/bloc/welcome_bloc.dart';
import 'package:elearning/features/welcome/bloc/welcome_event.dart';
import 'package:elearning/features/welcome/bloc/welcome_state.dart';
import 'package:elearning/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.pageIndex = index;
                  context.read<WelcomeBloc>().add(WelcomeEvent());
                },
                children: [
                  buildWelcomePages(size,
                      index: 1,
                      title: "First See Learning",
                      description:
                          "Forget abour for paper all knowledge in one learning.",
                      imagePath: "assets/images/welcome1.jpg"),
                  buildWelcomePages(size,
                      index: 2,
                      title: "Connect With Everyone",
                      description:
                          "Always keep in touch your tutor and frinds. Let's get connected.",
                      imagePath: "assets/images/welcome2.jpg"),
                  buildWelcomePages(size,
                      index: 3,
                      title: "Always Facinated Learning",
                      description:
                          "Anywhere, anytime. The time is your diceration so study whenever you want.",
                      imagePath: "assets/images/welcome3.jpg",
                      buttonLable: "Get Started"),
                ],
              ),
              Positioned(
                bottom: 100,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: state.pageIndex,
                  decorator: DotsDecorator(
                    activeColor: AppColors.darkBlackColor,
                    activeSize: const Size(20, 10),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildWelcomePages(Size size,
      {String? imagePath,
      int? index,
      Color? backgroundColor = AppColors.lightPinkColor,
      String? title,
      String? description,
      String? buttonLable = "Next"}) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: size.height / 2,
          width: size.width,
          decoration: BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
              image: AssetImage(
                imagePath!,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColors.lightPinkColor.withOpacity(0.5), BlendMode.darken),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: AppTextStyle.style24(
              text: title.toString(), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: AppTextStyle.style18(
            text: description.toString(),
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlackColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.all(size.width / 20),
          child: reusableElevatedButton(
            size,
            lable: buttonLable.toString(),
            onPressed: () {
              if (index! < 3) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              } else {
                Global.storageService
                    .setBool(StroageConstants.APP_FIRST_OPEN, true);
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/login", (route) => false);
              }
            },
          ),
        ),
      ],
    );
  }
}
