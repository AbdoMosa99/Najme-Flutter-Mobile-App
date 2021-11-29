import 'package:flutter/material.dart';
import 'package:najme/components/containers/app_bar.dart';
import 'package:najme/components/containers/subject_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.screenBackground), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  '!مرحباً بك',
                  style: TextStyle(
                    color: AppColors.primaryDark,
                    fontSize: 36.0,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 10,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),

                  Expanded(
                    flex: 10,
                    child: SubjectCard(
                      onTap: (){},
                      image: Assets.mathSymbol,
                      text: 'حساب',
                    ),
                  ),

                  const Expanded(
                    flex: 1,
                    child: SizedBox()
                  ),

                  Expanded(
                    flex: 10,
                    child: SubjectCard(
                      onTap: (){},
                      image: Assets.arabicSymbol,
                      text: 'لغة عربية',
                    ),
                  ),

                  const Expanded(
                    flex: 1,
                    child: SizedBox()
                  ),
                ],
              ),
            ),

            const Expanded(
              flex: 1,
              child: SizedBox()
            ),

            Expanded(
              flex: 10,
              child: Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: SizedBox()
                  ),

                  Expanded(
                    flex: 10,
                    child: SubjectCard(
                      onTap: (){},
                      image: Assets.iqSymbol,
                      text: 'ذكاء',
                    ),
                  ),

                  const Expanded(
                    flex: 1,
                    child: SizedBox()
                  ),

                  Expanded(
                    flex: 10,
                    child: SubjectCard(
                      onTap: (){},
                      image: Assets.englishSymbol,
                      text: 'English',
                    ),
                  ),

                  const Expanded(
                    flex: 1,
                    child: SizedBox()
                  ),
                ],
              ),
            ),

            const Expanded(
              flex: 1,
              child: SizedBox()
            ),
          ],
        ),
      ),
    );
  }
}
