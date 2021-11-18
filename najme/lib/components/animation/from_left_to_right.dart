import 'package:flutter/cupertino.dart';

class LeftRightPageRoute extends PageRouteBuilder {
  final Widget widget;
  LeftRightPageRoute(this.widget)
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
                          begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(animation),
                  child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            });

  // @override
  // Widget build
}
