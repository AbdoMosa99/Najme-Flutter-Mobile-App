import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class PBackButton extends Align{
  PBackButton({
    Key? key,
    required BuildContext context,
    double size = 28.0,
    Color color = AppColors.primary
  })
  :
  super(
      key: key,
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_outlined,
          size: adjustValue(context, size),
          color: color,
        ),

        onPressed: (){
          Navigator.pop(
              context,false
          );
          },
      ),
  );

}