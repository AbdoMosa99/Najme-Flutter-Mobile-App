import 'package:flutter/material.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

import '../navbar/nav_bar.dart';


class mainContainer extends StatefulWidget {
  mainContainer({
      Key? key,
      required this.child,
      this.bgImage = Assets.screenBackground,
      this.appBar = null,
      this.floutingButton = null
  }) : super(key: key);

   Widget child;
   final String bgImage;
   var appBar;
   var floutingButton;

  @override
  _mainContainerState createState() => _mainContainerState();
}

class _mainContainerState extends State<mainContainer> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: widget.appBar,

        body: Container(
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
          ),

        floatingActionButton: widget.floutingButton,
      );
  }
}