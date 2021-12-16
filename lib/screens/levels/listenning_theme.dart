import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class ListenningTheme extends StatefulWidget {
  const ListenningTheme({ Key? key }) : super(key: key);

  @override
  State<ListenningTheme> createState() => _ListenningThemeState();
}

class _ListenningThemeState extends State<ListenningTheme> {
  var level = 0;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'استمع واختر الحرف',
                  style: TextStyle(
                      fontSize: adjustValue(context, 30.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                  )
                ),
                SvgPicture.asset(Assets.ele),
              ],
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.slow),
                SizedBox(width: adjustWidthValue(context,30),),
                SvgPicture.asset(Assets.audio),
              ],
            )
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                width: adjustValue(context, 140.0),
                height: adjustValue(context, 140.0),
                child: MainCard(
                  context: context,
                  text: "أ",
                  onTap: () {
                    setState(() {
                      level = 1;
                    });
                  },
                  color: level == 1 ? AppColors.primary : AppColors.surface,
                  textColor: level == 1 ? AppColors.white : AppColors.primary,
                  radius: 76.0,
                  fontSize: 56.0,
                ),
              ),
                Padding(
                  padding: EdgeInsets.all(adjustValue(context, 8.0)),
                  child: Text(
                    'أم',
                    style: TextStyle(
                      fontSize: adjustValue(context, 25.0),
                      fontFamily: 'Cairo',
                      // fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  width: adjustValue(context, 140.0),
                  height: adjustValue(context, 140.0),
                  child: MainCard(
                    context: context,
                    text: "ب",
                    onTap: () {
                      setState(() {
                        level = 2;
                      });
                    },
                    color: level == 2 ? AppColors.primary : AppColors.surface,
                    textColor: level == 2 ? AppColors.white : AppColors.primary,
                    radius: 76.0,
                    fontSize: 56.0,
                  ),
                ),
                
              ],
            )
          ),
        ],
      ),
    );
  }
}