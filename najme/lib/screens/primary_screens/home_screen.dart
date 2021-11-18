import 'package:flutter/material.dart';
import 'package:najme/components/containers/app_bar.dart';
import 'package:najme/components/containers/home_container.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      MainContainer(
        appBar: MainAppBar(),
        child: 
          Column(
            children: [
              const Expanded(
                flex: 1,
                child:
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: Text(
                      '!مرحباً بك',
                      style: 
                        TextStyle(
                          color: AppColors.primaryDark,
                          fontSize: 36.0,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w800,
                        ),
                    ),
                  ),
              ),

              Expanded(
                flex: 2,
                child:
                  Padding(
                    padding:
                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(
                      children: [
                        HomeContainer(
                          whenTap: (){},
                          image: Assets.math,
                          text: 'حساب',
                          color: AppColors.surface,
                          textColor: AppColors.primary,
                        ),

                        const SizedBox(
                          width: 25.0,
                        ),
                          
                        HomeContainer(
                          whenTap: (){
                          },
                          image: Assets.arabic,
                          text: 'لغة عربية',
                          color: AppColors.surface,
                          textColor: AppColors.primary,
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                Expanded(
                  flex: 2,
                  child:
                    Padding(
                      padding:
                        const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: 
                        Row(
                          children: [
                            HomeContainer(
                              whenTap: (){},
                              image: Assets.ai,
                              text: 'ذكاء',
                              color: AppColors.surface,
                              textColor: AppColors.primary,
                            ),

                            const SizedBox(
                              width: 25.0,
                            ),

                            HomeContainer(
                              whenTap: (){},
                              image: Assets.english,
                              text: 'English',
                              color: AppColors.surface,
                              textColor: AppColors.primary,
                            )
                          ],
                        ),
                    ),
                ),
              ],
          ),
      );
  }
}
