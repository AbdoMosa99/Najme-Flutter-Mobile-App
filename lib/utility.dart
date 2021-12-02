import 'package:flutter/material.dart';

double adjustValue(BuildContext context, double value) {
  return (
    0.7 * (value / 640) * MediaQuery.of(context).size.height
    + 0.3 * (value / 360) * MediaQuery.of(context).size.width
  );
}

double adjustHeightValue(BuildContext context, double value) {
  return (value / 640) * MediaQuery.of(context).size.height;
}

double adjustWidthValue(BuildContext context, double value) {
  return (value / 360) * MediaQuery.of(context).size.width;
}