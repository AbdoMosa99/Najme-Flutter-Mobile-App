import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/screens/drawer/personal_profile_updates.dart';
import '../../utility.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      appBar: MainAppBar(
        context: context,
      ),
      drawer: MainDrawer(
        context: context,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: adjustValue(context, 120),
                  height: adjustValue(context, 120),
                  decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.secondary,),
                   ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.male,
                      height: adjustValue(context, 80.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'منار شاهين',
            style: TextStyle(
              fontSize: adjustValue(context, 25.0),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
            ),
          ),
          Text(
            'KG2',
            style: TextStyle(
              fontSize: adjustValue(context, 20.0),
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, adjustValue(context, 20), 0, 0),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: adjustValue(context, 95),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withOpacity(adjustValue(context, 0.2)),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(adjustValue(context, 20)),
                    ),
                  ),
                  Container(
                      height: adjustValue(context, 90),
                      padding: EdgeInsets.all(adjustValue(context, 9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'التفوق',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                '8',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 15.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: AppColors.secondary,
                            thickness: adjustValue(context, 1),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'الفواكه',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                '25',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 15.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: AppColors.secondary,
                            thickness: adjustValue(context, 1),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'النجوم',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 20.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                '16',
                                style: TextStyle(
                                  fontSize: adjustValue(context, 15.0),
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.age,
                      height: adjustValue(context, 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, adjustValue(context, 15), 0),
                      child: Text(
                        '6 سنوات',
                        style: TextStyle(
                          fontSize: adjustValue(context, 15.0),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: adjustValue(context, 10),
                  thickness: adjustValue(context, 1),
                  indent: adjustValue(context, 10),
                  endIndent: adjustValue(context, 10),
                  color: AppColors.secondary,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.home,
                      height: adjustValue(context, 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, adjustValue(context, 15), 0),
                      child: Text(
                        'السويس',
                        style: TextStyle(
                          fontSize: adjustValue(context, 15.0),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: adjustValue(context, 10),
                  thickness: adjustValue(context, 1),
                  indent: adjustValue(context, 10),
                  endIndent: adjustValue(context, 10),
                  color: AppColors.secondary,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      Assets.work,
                      height: adjustValue(context, 30.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, adjustValue(context, 15), 0),
                      child: Text(
                        'طبيب',
                        style: TextStyle(
                          fontSize: adjustValue(context, 15.0),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: adjustHeightValue(context, 50.0),
            child: MainButton(
              context: context,
              text: 'تعديل الملف الشخصي',
              color: AppColors.primary,
              onTap: () {
                Navigator.push(
                  context,
                  InOutPageRoute(const PersonalProfileUpdates(), Alignment.bottomCenter),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
