

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utility.dart';

Widget PNavigationBar({
    required BuildContext context,
    required List<IconData> iconList,
    required Function(int) onTap,
    double iconSize = 40,
    int activeIndex = 1
})
{
  return AnimatedBottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.primary,
              activeColor: AppColors.secondary,
              inactiveColor: AppColors.secondary,
              iconSize: adjustValue(context, iconSize),
              icons: iconList,
              activeIndex: 1,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: adjustValue(context, 60),
              rightCornerRadius: adjustValue(context, 60),
              onTap: onTap,
              //onTap: (index) => setState(() => _bottomNavIndex = index),
            );
}