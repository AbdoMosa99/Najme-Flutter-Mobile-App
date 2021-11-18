import 'package:flutter/cupertino.dart';

class InOutPageRoute extends PageRouteBuilder {
  final Widget widget;
  InOutPageRoute(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 2),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticInOut);
              return ScaleTransition(
                  alignment: Alignment.center, scale: animation, child: child);
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            });
}
