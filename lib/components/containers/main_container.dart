import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';

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
      appBar: this.appBar,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(this.bgImage), 
            fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(child: this.child),
        )
      ),
      floatingActionButton: this.floutingButton
    );
  }
}