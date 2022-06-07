
import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class MessageBox extends StatelessWidget {
  final bool selfMode;
  final String text;

  final double padding = 5.0;

  MessageBox({ 
    Key? key,
    required this.selfMode,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: adjustValue(context, 20.0),
      color: selfMode? Colors.white : AppColors.primaryDark,
    );
    final size = textSize(text, textStyle);

    return Align(
      alignment: selfMode? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        
        width: size.width + padding * 6 + 20.0,
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding*3),
        margin: EdgeInsets.only(
          top: padding,
          bottom: padding,
          right: selfMode? 0 : padding * 5,
          left: selfMode? padding * 5 : 0,
        ),
        decoration: BoxDecoration(
          color: selfMode? AppColors.primary : AppColors.surface,
          borderRadius: selfMode? 
            BorderRadius.horizontal(left: Radius.circular(32.0))
            : BorderRadius.horizontal(right: Radius.circular(32.0))
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

