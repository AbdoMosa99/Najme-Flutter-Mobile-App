import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/utility.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.child,
    this.bgImage = Assets.screenBackground,
    this.appBar,
    this.floutingButton,
  }) 
  : super(key: key);

  final Widget child;
  final String bgImage;
  final AppBar? appBar;
  final FloatingActionButton? floutingButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage), 
            fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(adjustValue(context, 20.0)),
          child: child,
        )
      ),
      floatingActionButton: floutingButton
    );
  }
}