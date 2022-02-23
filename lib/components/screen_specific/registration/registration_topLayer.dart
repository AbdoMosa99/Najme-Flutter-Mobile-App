import 'package:flutter/material.dart';
import 'package:najme/components/general/progress_bar.dart';

import '../../../constants/colors.dart';
import '../../../utility.dart';


class TopLayer extends Align {
  TopLayer({
    Key? key,
    required BuildContext context,
    required double width,
    required void Function() onPressed,
  })
  :super(
    key: key,
    alignment: Alignment.topLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProgressBar(
          context: context,
          width: width,
        ),
          Padding(
            padding: EdgeInsets.only(top : adjustValue(context, 14), left: adjustValue(context, 15)),
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: adjustValue(context, 30.0),
                color: AppColors.primary,
              ),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
      );
}