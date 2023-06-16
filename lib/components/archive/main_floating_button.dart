import 'package:flutter/material.dart';
import 'package:najme/constants/colors.dart';

class MainFloatingButton extends FloatingActionButton {
  MainFloatingButton({
    Key? key, 
    IconData icon = Icons.arrow_forward_sharp, 
    void Function()? onTap
  })
  : super(
    key: key,
    onPressed: onTap,
    backgroundColor: AppColors.primary,
    child: Icon(
      icon,
    ),
  );
}


