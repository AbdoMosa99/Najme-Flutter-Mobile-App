import 'package:flutter/material.dart';

import 'utils.dart';

TextStyle _getCairoTextStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    fontFamily: FontFamily.cairo,
    color: color,
    fontSize: fontSize,
  );
}

TextStyle getCairoBoldStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}

TextStyle getCairoSemiBoldStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
  );
}

TextStyle getCairoRegularStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}

TextStyle getCairoMediumStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}

TextStyle getCairoLightStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

TextStyle getCairoExtraLightStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
}) {
  return _getCairoTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.extraLight,
    color: color,
  );
}
