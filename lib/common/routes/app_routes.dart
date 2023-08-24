import 'package:elearning/common/routes/index.dart';
import 'package:elearning/features/auth/login/view/login_view.dart';
import 'package:elearning/features/main/build_main/view/main_view.dart';
import 'package:elearning/global.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static MaterialPageRoute gentrateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = AppViews()
          .routes()
          .where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("1st log");
        bool appInitial = Global.storageService.getAppInitial();
        if (result.first.route == NamedRoutes.INITIAL && appInitial) {
          print("2nd log");
          bool isLoggedIn = Global.storageService.getLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const MainView(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const LoginView(), settings: settings);
        }

        print("this is valid route : {$settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.view, settings: settings);
      }
    }
    print("this route is not valid : {$settings.name}");
    return MaterialPageRoute(
        builder: (_) => const LoginView(), settings: settings);
  }
}
