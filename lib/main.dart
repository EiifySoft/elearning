import 'package:elearning/common/colors/index.dart';
import 'package:elearning/common/routes/index.dart';
import 'package:elearning/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Global.globalInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppViews().allBlocProvider(context)],
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
        onGenerateRoute: AppRoutes.gentrateRouteSettings,
      ),
    );
  }
}
