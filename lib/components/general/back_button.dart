

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utility.dart';

class PBackButton extends Align{
  PBackButton({
    Key? key,
    required BuildContext context,
    double size = 28.0
  })
  :
  super(
      key: key,
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios_outlined,
          size: adjustValue(context, size),
          color: AppColors.primary,
        ),

        onPressed: (){
          Navigator.pop(
              context,false
          );
          },
      ),
  );

}