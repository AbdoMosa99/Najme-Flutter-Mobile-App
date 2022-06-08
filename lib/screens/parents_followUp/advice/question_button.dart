
import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class QuestionButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final double padding = 10.0;

  const QuestionButton({ 
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontFamily: 'Cairo',
      fontSize: adjustValue(context, 20.0),
      color: AppColors.primaryDark,
    );
    final size = textSize(text, textStyle);

    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
            width: size.width + padding * 2,
            height: size.height + padding * 2,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ),
      );
  }
}
