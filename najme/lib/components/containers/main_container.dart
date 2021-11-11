import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';


class mainContainer extends StatefulWidget {
  mainContainer({
      Key? key,
      required this.child,
      this.bgImage = Assets.screenBackground,
      this.appBar = false,
  }) : super(key: key);


   Widget child;
   final String bgImage;
   final bool appBar;


  @override
  _mainContainerState createState() => _mainContainerState();
}

class _mainContainerState extends State<mainContainer> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(


        appBar: widget.appBar ? AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                size: 40,
              )
          ),
          actions: [
              Container(
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'نجمي',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Container(
                alignment: AlignmentDirectional.center,
                child: const Image(
                  image: AssetImage(Assets.logo),
                ),
              ),
          ],
        ) : null,

          

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

      );

  }
}