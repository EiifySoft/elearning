import 'package:elearning/common/routes/index.dart';
import 'package:elearning/features/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static MaterialPageRoute gentrateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = AppViews()
          .routes()
          .where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
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
