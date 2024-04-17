import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Core/Config/page_route_names.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context)
          .pushReplacementNamed(PageRouteName.home, arguments: [0]);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Lottie.asset(
            'assets/lottie/launch_screen.json',
            fit: BoxFit.fill,
            repeat: true,
            controller: controller,
            onLoaded: (composition) {
              controller.forward();
            },
          ),
        ),
      ),
    );
  }
}
