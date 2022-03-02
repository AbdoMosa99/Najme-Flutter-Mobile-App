import 'package:flutter/material.dart';
import 'package:najme/utility.dart';

class HeightSizedBox extends SizedBox {
  HeightSizedBox({
    Key? key,
    required BuildContext context,
    required double value,
  }) : super(
          key: key,
          height: adjustHeightValue(context, value),
        );
}
