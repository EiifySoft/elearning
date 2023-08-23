import 'package:elearning/common/routes/index.dart';
import 'package:elearning/features/auth/login/bloc/index.dart';
import 'package:elearning/features/auth/login/view/login_view.dart';
import 'package:elearning/features/auth/register/bloc/register_bloc.dart';
import 'package:elearning/features/auth/register/view/register_view.dart';
import 'package:elearning/features/main/build_main/bloc/main_bloc.dart';
import 'package:elearning/features/main/build_main/view/main_view.dart';
import 'package:elearning/features/welcome/bloc/welcome_bloc.dart';
import 'package:elearning/features/welcome/view/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppViewsModel {
  String route;
  Widget view;
  dynamic bloc;

  AppViewsModel({required this.route, required this.view, required this.bloc});
}

class AppViews {
  List<AppViewsModel> routes() {
    return [
      AppViewsModel(
        route: NamedRoutes.INITIAL,
        view: const WelcomeView(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      AppViewsModel(
        route: NamedRoutes.LOGIN,
        view: const LoginView(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      AppViewsModel(
        route: NamedRoutes.REGISTER,
        view: const RegisterView(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      AppViewsModel(
        route: NamedRoutes.MAINVIEW,
        view: const MainView(),
        bloc: BlocProvider(
          create: (_) => MainBloc(),
        ),
      ),
    ];
  }

  List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}
