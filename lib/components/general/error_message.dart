import 'package:flutter/material.dart';
import 'package:najme/utility.dart';

class ErrorMessage extends Container{
  ErrorMessage({
    Key? key,
    required BuildContext context,
    required String message,
  })
  : super(
      key: key,
      alignment: Alignment.centerRight,
      child: Padding(
        padding:  EdgeInsets.only(
          right: adjustWidthValue(context, 20.0),
        ),
        child: Text(
          message,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: adjustValue(context, 18.0),
            color: Colors.red,
          ),
        ),
      ),
  );
}