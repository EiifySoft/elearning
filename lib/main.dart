import 'package:elearning/bloc_provider/bloc_provider.dart';
import 'package:elearning/common/colors/index.dart';
import 'package:elearning/features/auth/login/view/login_view.dart';
import 'package:elearning/features/auth/register/view/register_view.dart';
import 'package:elearning/features/counter/view/counter_view.dart';
import 'package:elearning/features/main/build_main/view/main_view.dart';
import 'package:elearning/features/welcome/view/welcome_view.dart';
import 'package:elearning/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Global().globalInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProvider.provider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E L E R N I N G',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0,
            centerTitle: false,
          ),
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          useMaterial3: true,
        ),
        home: const WelcomeView(),
        routes: {
          "counter": (context) => const CounterView(),
          "login": (context) => const LoginView(),
          "register": (context) => const RegisterView(),
          "main": (context) => const MainView(),
        },
      ),
    );
  }
}
