import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/constants/colors.dart';

import '../../../utility.dart';

class Galaxy extends InkWell {
  Galaxy({
    Key? key,
    required BuildContext context,
    required String img,
    required String backEMG,
    required String text,
    void Function()? onClick,
  }) : super(
    key: key,
    onTap: onClick,
    child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                backEMG,
                height: adjustHeightValue(context, 90),
              ),
              SvgPicture.asset(
                img,
                height: adjustHeightValue(context, 50),
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: adjustValue(context, 15),
              color:AppColors.secondary,
              fontFamily: 'Cairo',
            ),
          )
        ],
      ),
  );
}
