import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainButton extends MaterialButton {
  MainButton({
    Key? key,
    required BuildContext context,
    required String text,
    Color color = AppColors.primary,
    double font = 20,
    void Function()? onTap,
  })
  : super(
    key: key,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
    ),
    color: color,
    onPressed: onTap,
    child: Text(
      text,
      textAlign: TextAlign.center,
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Cairo',
        color: AppColors.white,
        fontSize: adjustValue(context, font),
      ),
    ),
  );
}
