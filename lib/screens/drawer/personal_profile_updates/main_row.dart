import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class RowPersonalUpdates extends Row {
  RowPersonalUpdates({
    Key? key,
    required BuildContext context,
    required Widget widget,
    required String title,
  }) : super(
          key: key,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: adjustValue(context, 20.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(flex: 2, child: widget),
          ],
        );
}
