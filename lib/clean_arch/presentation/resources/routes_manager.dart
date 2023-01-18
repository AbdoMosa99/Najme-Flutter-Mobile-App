import 'package:flutter/material.dart';

import 'utils.dart';

class RoutesManager{
  static const String splashRoute = '/'; // '/' to make the splash screen the main route
  static const String loginRoute = '/login';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        // return _moveRoute(SplashView());

      default:
        return _moveRoute(const NoRouteFound());
    }
  }

  static PageRoute _moveRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

class NoRouteFound extends StatelessWidget {
  const NoRouteFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(StringsManager.noRouteFound),
      ),
    );
  }
}