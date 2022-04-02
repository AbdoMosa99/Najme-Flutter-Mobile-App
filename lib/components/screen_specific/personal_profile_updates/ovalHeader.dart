import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class OvalHeader extends Stack {
  OvalHeader({
    Key? key,
    required BuildContext context,
    required String title,
  }) : super(
          children: [
            Container(
              width: double.infinity,
              height: adjustHeightValue(context, 54),
              color: AppColors.primary,
            ),
            ClipOval(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                title,
                    style: TextStyle(
                      fontSize: adjustWidthValue(context, 30.0),
                      fontFamily: 'Cairo',
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.none,
                    )),
                color: AppColors.primary,
                width: double.infinity,
                height: adjustHeightValue(context, 110),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(
                    top: adjustValue(context, 110.0),
                    right: adjustValue(context, 15.0)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryLight.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      Assets.falsePic,
                      height: adjustValue(context, 20.0),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
}
