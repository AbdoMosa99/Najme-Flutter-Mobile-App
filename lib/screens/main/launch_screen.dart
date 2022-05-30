import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/components/animation/from_in_to_out.dart';

import 'login_screen.dart';



class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>with SingleTickerProviderStateMixin {
  late AnimationController controller ;
  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
      );
      controller.addStatusListener((status) async {
        if (status == AnimationStatus.completed)
        {
          controller.repeat();
        }
      });
}
  @override
  void dispose(){
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
          child:
            Lottie.asset(
              'assets/lottie/launch_screen.json', 
              fit: BoxFit.fill, 
              repeat: true,     
              controller: controller, 
              onLoaded: (composition){
                controller.forward();
              },
              ), 
    
    )),
    
    );
  }
}