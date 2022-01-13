import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/space/lessons_screen.dart';
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
    elevation: adjustValue(context, 1.0),
    backgroundColor: AppColors.surface,
    iconTheme: const IconThemeData(color: AppColors.primaryDark),

    leading: Center(
      child: Padding(
        padding: EdgeInsets.all(adjustValue(context, 5.0)),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.volume_up
          ),
          iconSize: adjustValue(context, 30.0),
        ),
      ),
    ),
    leadingWidth: adjustValue(context, 50.0),

    title: Text(
      gameName,
      style: TextStyle(
        color: AppColors.primaryDark,
        fontSize: adjustValue(context, 25.0),
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,

    actions: [
      Center(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(adjustValue(context, 5.0)),
            child: IconButton(
              onPressed: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const LessonsScreen(), -1, 0),
                    );
                  },
              icon: const Icon(
                Icons.arrow_forward,
              ),
              iconSize: adjustValue(context, 30.0),
            ),
          ),
        ),
      ),
    ],
  );
}
