import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class SubjectCard extends Card {
  SubjectCard({
    Key? key,
    required BuildContext context,
    required String image,
    required String text,
    Color color = AppColors.surface,
    Color textColor = AppColors.primaryDark,
    double redius = 15.0,
    void Function()? onTap,
  })
  : 
  super(
    key: key,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
    ),
    elevation: adjustValue(context, 3.0),
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
            child: Padding(
              padding: EdgeInsets.all(adjustValue(context, 8.0)),
              child: SvgPicture.asset(image),
            ),
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
              fontSize: adjustValue(context, 30.0),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
