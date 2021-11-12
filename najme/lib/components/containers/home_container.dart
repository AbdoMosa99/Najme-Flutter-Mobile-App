import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:najme/components/containers/main_registration_image.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeContainer extends StatefulWidget {
  HomeContainer({
    Key? key,
    this.image = Assets.error,
    this.text = 'Null',
    this.width = 173,
    this.height = 220,
    this.color = AppColors.surface,
    this.textColor = AppColors.primaryDark,
    this.whenTap = null,
  }): super(key: key);

  final String image;
  final String text;
  Color color;
  Color textColor;
  final double width;
  final double height;
  var whenTap;

  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.whenTap,
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

                mainImage(
                  image: widget.image,
                  height: 108,
                  width: 108,
                ),

                const SizedBox(
                  height: 25.0,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 30.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            )
          ),
      ),
    );
  }
}
