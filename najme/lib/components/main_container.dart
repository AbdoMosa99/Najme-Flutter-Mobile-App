import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';


class mainContainer extends StatefulWidget {
  mainContainer({
      Key? key,
      required this.child,
      this.bgImage = Assets.screenBackground,
  }) : super(key: key);


   Widget child;
   String bgImage;


  @override
  _mainContainerState createState() => _mainContainerState();
}

class _mainContainerState extends State<mainContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.bgImage),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: widget.child
          ),
        )
    );;
  }
}