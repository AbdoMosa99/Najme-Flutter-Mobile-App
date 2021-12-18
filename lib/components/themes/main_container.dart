import 'package:flutter/material.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/utility.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({ 
    Key? key, 
    required this.child,
    this.appBar,
    //required this.child, required GameAppBar appBar,
  }) : 
  super(key: key,);

  final AppBar? appBar;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBar,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.screenBackground), 
              fit: BoxFit.cover
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(adjustValue(context, 20.0)),
              child: child,
              ),
        ),
      ),
    );
  }
}