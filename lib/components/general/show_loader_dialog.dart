import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

showLoaderDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      backgroundColor: AppColors.surface,
      
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: AppColors.secondary,
          ),
          SizedBox(height: 10,),
          Container(
            child:Text("... من فضلك انتظر",
            style: TextStyle(
              fontSize: adjustValue(context, 15.0),
                fontFamily: 'Cairo',
                color: AppColors.primaryDark,
            ),
            )
          ),
        ],),);
    showDialog(
      barrierDismissible: true,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
}