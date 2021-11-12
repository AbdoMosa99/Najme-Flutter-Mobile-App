import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:najme/components/containers/main_registration_image.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class JobContainer extends StatefulWidget {
  JobContainer({
    Key? key,
    this.image = Assets.error,
    this.text = 'Null',
    this.width = 115,
    this.height = 142,
    this.color = AppColors.surface,
    this.textColor = AppColors.primaryDark,
    required this.whenTap,
  }): super(key: key);

  final String image;
  final String text;
  Color color;
  Color textColor;
  final double width;
  final double height;
  Function whenTap;

  @override
  _JobContainerState createState() => _JobContainerState() ;
}

class _JobContainerState extends State<JobContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.whenTap();
        },
        child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                42.0,
              ),
              color: widget.color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainImage(
                  image: widget.image,
                  height: 70,
                  width: 70,
                ),

                const SizedBox(
                  height: 0.0,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: 24.0,
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
