import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class GameAppBar extends AppBar {
  GameAppBar({
    Key? key, 
    required BuildContext context,
    required String gameName,
  }) 
  : super(
    key: key,
    toolbarHeight: adjustValue(context, 50.0),
    backgroundColor: AppColors.surface,
    centerTitle: true,
    elevation: 1.0,
    iconTheme: const IconThemeData(color: AppColors.primaryDark),
    titleTextStyle: const TextStyle(color: AppColors.primaryDark),
    leading: Center(
      child: Padding(
        padding: EdgeInsets.all(adjustValue(context, 5.0)),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
          iconSize: adjustValue(context, 24.0),
        ),
      ),
    ),
    title: Text(
      gameName,
      style: TextStyle(
        fontSize: adjustValue(context, 25.0),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(adjustValue(context, 5.0)),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.surround_sound
            ),
            iconSize: adjustValue(context, 24.0),
          ),
        ),
      ),
    ],
  );
}
