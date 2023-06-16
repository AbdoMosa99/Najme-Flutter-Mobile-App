import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

get controller => null;
showDoneDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.surface,
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/lottie/Done.json',
          repeat: true,
          controller: controller,
        ),
        Center(
          child: Text(
            'تم بنجاح',
            style: TextStyle(
              fontSize: adjustValue(context, 30.0),
              fontFamily: 'Cairo',
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
