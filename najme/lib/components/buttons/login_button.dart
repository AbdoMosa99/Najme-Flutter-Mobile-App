import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    Key? key,
    this.text = 'Null',
    this.color = AppColors.primary,
    this.whenTap = null
  }): super(key: key);

  final String text;
  final Color color;
  var whenTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: color,
      ),
      child: MaterialButton(
        onPressed: whenTap,
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
