import 'package:flutter/material.dart';
import 'package:najme/data.dart';

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

bool validateEmail(String value) {
  RegExp emailRE = RegExp(
    """^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$"""
  );
  return emailRE.hasMatch(value);
}

bool validatePassword(String value) {
  RegExp passwordRE = RegExp(
    """^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}\$"""
  );
  return passwordRE.hasMatch(value);
}

int calculateDate(DateTime date) {
  DateTime now = DateTime.now();
  int age = now.year - date.year;
  if (
  now.month < date.month || (now.month == date.month && now.day < date.day)
  )
    age--;
  return age;
}

