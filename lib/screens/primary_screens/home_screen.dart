import 'package:flutter/material.dart';
import 'package:najme/components/containers/app_bar.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/screen_specific/home_screen/subject_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: MainAppBar(),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '!مرحباً بك',
                style: TextStyle(
                  color: AppColors.primaryDark,
                  fontSize: adjustValue(context, 36.0),
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: SubjectCard(
                    context: context,
                    onTap: () {},
                    image: Assets.mathSymbol,
                    text: 'حساب',
                  ),
                ),
                
                SizedBox(
                  width: adjustValue(context, 15.0),
                ),
                
                Expanded(
                  child: SubjectCard(
                    context: context,
                    onTap: () {},
                    image: Assets.arabicSymbol,
                    text: 'لغة عربية',
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: adjustValue(context, 15.0),
          ),

          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: SubjectCard(
                    context: context,
                    onTap: () {},
                    image: Assets.iqSymbol,
                    text: 'ذكاء',
                  ),
                ),
                
                SizedBox(
                  width: adjustValue(context, 15.0),
                ),

                Expanded(
                  child: SubjectCard(
                    context: context,
                    onTap: () {},
                    image: Assets.englishSymbol,
                    text: 'English',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
