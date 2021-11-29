import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({
    Key? key,
    required this.child,
    this.bgImage = Assets.screenBackground,
    this.appBar,
    this.floutingButton,
  }) : super(key: key);

  final Widget child;
  final String bgImage;
  final PreferredSizeWidget? appBar;
  final Widget? floutingButton;

  @override
  _MainContainerState createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.bgImage), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(child: widget.child),
            )),
        floatingActionButton: widget.floutingButton);
  }
}
