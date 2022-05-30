import 'package:flutter/cupertino.dart';

class InOutPageRoute extends PageRouteBuilder {
  final Widget widget;
  final Alignment alignment;
  InOutPageRoute(
    this.widget,
    this.alignment,
  ) : super(
            transitionDuration: const Duration(milliseconds: 1500),
            reverseTransitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
                  //TO MAKE IT FASTER
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                  alignment: alignment,
                  scale: animation,
                  child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            });
}
