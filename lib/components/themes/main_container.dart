import 'package:flutter/material.dart';
import 'package:najme/components/general/game_app_bar.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/utility.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({ 
    Key? key, 
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: GameAppBar(context:context,gameName:'المستوي2'),
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