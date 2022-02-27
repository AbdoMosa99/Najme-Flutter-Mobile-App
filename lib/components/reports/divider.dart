import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

import '../../utility.dart';

class DividerLine extends Divider {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(adjustValue(context, 18)),
      child: Column(
        children: [
          Divider(
            height: adjustValue(context, 10),
            thickness: adjustHeightValue(context, 1.7),
            indent: adjustValue(context, 10),
            endIndent: adjustValue(context, 10),
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }
}
