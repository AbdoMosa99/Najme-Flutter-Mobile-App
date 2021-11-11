import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({
    Key? key,
    this.image = const AssetImage(Assets.error),
    this.text = 'Null',
    this.width = 173,
    this.height = 233.11,
    this.color = AppColors.surface,
    this.textColor = AppColors.primaryDark,
  }): super(key: key);

  ImageProvider image;
  String text;
  Color color;
  Color textColor;
  double width;
  double height;

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          //if(widget.counter == widget.counter)
          setState(() {
            
          });
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: widget.color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: widget.image,
                  height: 108,
                  width: 108,
                ),
                const SizedBox(
                  height: 27.0,
                ),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 36.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
