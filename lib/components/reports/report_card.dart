import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import '../../utility.dart';

class ReportCard extends Container{
  ReportCard({
    Key? key,
    required BuildContext context,
    required String titleText, numText, percentageText,
    bool up = true,
    var upText , downText
  })
  : super(
    key: key,
    child: Container(
        width: adjustWidthValue(context, 320),
        height: adjustHeightValue(context, 85.0),
        decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(adjustValue(context, 20.0)),
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(
                  0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image(
                  height: adjustHeightValue(context, 90),
                  image: AssetImage(Assets.logo),
                ),
                Text(
                  percentageText,
                  style: TextStyle(
                      fontSize: adjustValue(context, 25.0),
                      fontFamily: 'Cairo',
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: TextStyle(
                      fontSize: adjustValue(context, 20.0),
                      fontFamily: 'Cairo',
                      color: AppColors.primaryDark,
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      numText,
                      style: TextStyle(
                          fontSize: adjustValue(context, 20.0),
                          fontFamily: 'Cairo',
                          color: AppColors.primaryDark,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      up ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
                      color: up? Colors.green : Colors.red,
                      size: 40,
                    ),
                    Text(
                      up ? upText : downText,
                      style: TextStyle(
                          fontSize: adjustValue(context, 20.0),
                          fontFamily: 'Cairo',
                          color: up? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ))
  );
}