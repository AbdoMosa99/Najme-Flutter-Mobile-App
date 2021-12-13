import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainCard extends Card {
  MainCard({
    Key? key,
    required BuildContext context,
    String? image,
    String? text,
    Color color = AppColors.surface,
    Color textColor = AppColors.primaryDark,
    double radius = 15.0,
    double fontSize = 30.0,
    bool stroke = false,
    void Function()? onTap,
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
      child: Padding(
        padding: EdgeInsets.all(adjustValue(context, 8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [          
            if (image != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(image),
              ),
            ),
          
            if (text != null)
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: adjustValue(context, fontSize),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
