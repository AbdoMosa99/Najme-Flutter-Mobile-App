import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class JobContainer extends StatefulWidget {
  JobContainer({
    Key? key,
    this.image = Assets.error,
    this.text = 'Null',
    this.width = 115,
    this.height =142,
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
  _JobContainerState createState() => _JobContainerState() ;
}

class _JobContainerState extends State<JobContainer> {
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
                adjustValue(context, 42.0),
              ),
              color: widget.color,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(widget.image),
                  height: adjustValue(context, 70),
                  width: adjustValue(context, 70),
                ),

                Text(
                  widget.text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: widget.textColor,
                    fontSize: adjustValue(context, 24.0),
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
