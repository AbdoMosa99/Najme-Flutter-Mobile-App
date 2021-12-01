import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class MainButton extends MaterialButton {
  MainButton({
    Key? key,
    required String text,
    Color color = AppColors.primary,
    void Function()? onTap,
  })
  : super(
    key: key,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    color: color,
    onPressed: onTap,
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
  );
}
