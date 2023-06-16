import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';


class UnitIcon extends InkWell {
  UnitIcon({
    Key? key,
    required BuildContext context,
    required String icon,
    required String title,
    void Function()? onClick,
    required bool active,
  }) : super(
    key: key,
    onTap: active? onClick : null,
    child: Opacity(
      opacity: active? 1.0 : 0.5,
      child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  Assets.galaxy,
                  height: adjustHeightValue(context, 90),
                ),
                SvgPicture.asset(
                  icon,
                  height: adjustHeightValue(context, 50),
                ),
              ],
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: adjustValue(context, 15),
                color:AppColors.secondary,
                fontFamily: 'Cairo',
              ),
            )
          ],
        ),
    ),
  );
}
