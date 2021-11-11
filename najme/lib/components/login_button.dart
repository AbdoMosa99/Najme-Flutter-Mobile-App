import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class LoginButton extends StatelessWidget {
  LoginButton(Key? key, this.text, this.color) 
  : super(key: key);

  String text;
  // double height;
  // double width;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // width: width,
      // height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: const TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.surface,
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}
