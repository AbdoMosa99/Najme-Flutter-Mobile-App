import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

Widget settingsRow(
  {
    required BuildContext context,
    required String icon,
    required String leadingText,
    required void Function(bool)? onChanged,
    required bool value,
  }
) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset(
            icon,
            width: 40.0,
          ),
        ),
        
        Expanded(
          child: Text(
            leadingText,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: adjustValue(context, 16.0),
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        
        Directionality(
          textDirection: TextDirection.ltr,
          child: Transform.scale(
            scale: 1.4,
            child: Switch(
              value: value, 
              onChanged: onChanged,
              activeTrackColor: AppColors.secondary,
              activeColor: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
