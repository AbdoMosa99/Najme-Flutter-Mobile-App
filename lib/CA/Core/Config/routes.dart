import 'package:flutter/material.dart';
import 'package:najme/CA/Core/Config/page_route_names.dart';

import '../../Features/pages.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: settings);
      case PageRouteName.home:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const HomeView(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
