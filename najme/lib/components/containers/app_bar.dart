import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key}) : super(
    key: key,
    backgroundColor: AppColors.primary,
    leading: 
      IconButton(
        onPressed: () {},
        icon: 
          const Icon(
            Icons.menu,
            size: 40,
          ),
      ),
    actions: [
      Container(
        alignment: AlignmentDirectional.center,
        child:
          const Text(
            'نچمي',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
      ),
      Container(
        alignment: AlignmentDirectional.center,
        child:
          const Image(
            image: AssetImage(Assets.logo),
          ),
      ),
    ],
  );
}
