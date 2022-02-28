

import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../../constants/colors.dart';
import '../../utility.dart';

Widget FloatingLogoButton({
  Function? onPressed,
  required BuildContext context,
})
{
  return Container(
              width: 80,
              height: 80,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: AppColors.primaryLight,
                  child: Image(
                    height: adjustHeightValue(context, 40),
                    image: AssetImage(Assets.logo),
                  ),
                  onPressed: () {},
                ),
              ),
            );
}