import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utility.dart';

class ProgressBar extends Container {
  ProgressBar({
    Key? key,
    required BuildContext context,
    required double width,
  })
  :super(
        key: key,
        height: adjustHeightValue(context, 20.0),
        width: MediaQuery.of(context).size.width * width,
        decoration: new BoxDecoration(
            color: AppColors.secondary,
            borderRadius: new BorderRadius.only(
              bottomRight: Radius.circular(width != 1 ? 40.0 : 0.0),
              topRight: Radius.circular(width != 1 ? 40.0 : 0.0),
            )
        ),
      );
}