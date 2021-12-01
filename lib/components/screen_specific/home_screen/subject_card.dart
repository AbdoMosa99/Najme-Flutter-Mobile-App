import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/colors.dart';

class SubjectCard extends Card {
  SubjectCard({
    Key? key,
    required String image,
    required String text,
    Color color = AppColors.surface,
    Color textColor = AppColors.primaryDark,
    void Function()? onTap,
  })
  : 
  super(
    key: key,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    elevation: 3.0,
    color: color,
    child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox()
          ),
          
          Expanded(
            flex: 9,
            child: SvgPicture.asset(image),
          ),

          const Expanded(
            flex: 1,
            child: SizedBox()
          ),

          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 30.0,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
