import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainAppBar extends AppBar {
  MainAppBar({
    Key? key, 
    required BuildContext context,
  }) 
  : super(
    key: key,
    toolbarHeight: adjustValue(context, 50.0),
    backgroundColor: AppColors.primary,
    leading: Center(
      child: Padding(
        padding: EdgeInsets.all(adjustValue(context, 5.0)),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
          iconSize: adjustValue(context, 30.0),
        ),
      ),
    ),
    actions: [
      Center(
        child: Text(
          'نچمي',
          style: TextStyle(
            fontSize: adjustValue(context, 25.0),
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      Center(
        child: Padding(
          padding: EdgeInsets.all(adjustValue(context, 5.0)),
          child: const Image(
            image: AssetImage(Assets.logo),
          ),
        ),
      ),
    ],
  );
}
