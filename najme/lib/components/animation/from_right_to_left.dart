import 'package:flutter/cupertino.dart';

class RightLeftPageRoute extends PageRouteBuilder {
  final Widget widget;
  RightLeftPageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 2),
            reverseTransitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animation),
                  child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            });
}
