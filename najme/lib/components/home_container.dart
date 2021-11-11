import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer(Key? key, this.image, this.text, this.counter)
      : super(key: key);

  ImageProvider image;
  String text;
  int counter = 0;
  Color loon = AppColors.surface;
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if(widget.counter == widget.counter)
          setState(() {
            
          });
        },
        child: Container(
            width: 173,
            height: 233.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: widget.loon,
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
                  style: const TextStyle(
                    color: AppColors.primaryDark,
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
