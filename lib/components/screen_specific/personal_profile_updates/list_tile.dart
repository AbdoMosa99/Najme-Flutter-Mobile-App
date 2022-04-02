import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/drawer/personal_profile_updates/personal_profile_updates.dart';
import 'package:najme/utility.dart';

Widget ListTileItem({
  required BuildContext context,
  required GenderEnum gender,
  required void Function(GenderEnum?) onChoose,
  required List list,
  required List values,
}) {
  return Row(children: <Widget>[
    for (var i = 0; i < list.length; i++)
      Expanded(
        child: ListTile(
          contentPadding: EdgeInsets.only(left: adjustValue(context, 10.0)),
          title: Text(
            '${list[i]}',
            style: TextStyle(
              fontSize: adjustWidthValue(context, 18.0),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
          leading: Transform.scale(
            scale: 1.1,
            child: Radio<GenderEnum>(
                activeColor: AppColors.secondary,
                value: values[i],
                groupValue: gender,
                onChanged: onChoose),
          ),
        ),
      ),
  ]);
}
