import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainCard extends Card {
  MainCard({
    Key? key,
    required BuildContext context,
    Widget? image,
    String? text,
    Color color = AppColors.surface,
    Color textColor = AppColors.primaryDark,
    double radius = 15.0,
    double fontSize = 30.0,
    bool stroke = false,
    bool circle = false,
    void Function()? onTap,
    double padding = 8.0,
  })
  : 
  super(
    key: key,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(adjustValue(context, radius)),
      side: stroke? BorderSide(color: AppColors.secondary, width: adjustValue(context, 1.0)) : BorderSide.none,
    ),
    elevation: stroke? null : adjustValue(context, 3.0),
    color: color,
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: circle? BoxShape.circle : BoxShape.rectangle
        ),
        child: Padding(
          padding: EdgeInsets.all(adjustValue(context, padding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [          
              if (image != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: image,
                ),
              ),
            
              if (text != null)
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: adjustWidthValue(context, fontSize),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
