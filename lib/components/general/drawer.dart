import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/show_loader_dialog.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/games/games_screen.dart';
import 'package:najme/screens/drawer/children_profiles.dart';
import 'package:najme/screens/drawer/contactus_screen.dart';
import 'package:najme/screens/drawer/personal_profile.dart';
import 'package:najme/screens/drawer/planet.dart';
import 'package:najme/screens/drawer/rateing_screen.dart';
import 'package:najme/screens/drawer/store.dart';
import 'package:najme/utility.dart';
import 'package:najme/data.dart';
import 'package:najme/screens/main/login_screen.dart';
import 'package:najme/screens/parents_followUp/report/report.dart';

class MainDrawer extends Drawer {
  MainDrawer({
    Key? key,
    required BuildContext context,
  }) : super(
          key: key,
          child: Container(
            color: AppColors.primary,
            margin: EdgeInsets.zero,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: adjustHeightValue(context, 118.0),
                  child: DrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColors.primaryLight,
                    ),
                    child: Row(
                      children: [
                        profile.gender == 'ولد'?
                        Expanded(
                            child: SvgPicture.asset(
                          Assets.male,
                          width: adjustValue(context, 80.0),
                        )):
                        Expanded(
                            child: SvgPicture.asset(
                          Assets.female,
                          width: adjustValue(context, 80.0),
                        )),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name,
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.surface,
                                  fontFamily: 'Cairo',
                                  fontSize: adjustValue(context, 24.0),
                                ),
                              ),
                              Text(
                                '${profile.level}',
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.surface,
                                  fontFamily: 'Cairo',
                                  fontSize: adjustValue(context, 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'الملف الشخصي',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.faceBlack,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const PersonalProfile(), -1, 0),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'كوكبي',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.drawer_planet,
                    // color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const PlanetScreen(), -1, 0),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'جزيرة المتاجر',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.cart,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const StoreScreen(), -1, 0),
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: adjustValue(context, 6.0)),
                  child: Divider(
                    color: AppColors.secondary,
                    thickness: 1,
                    indent: adjustValue(context, 50.0),
                    endIndent: adjustValue(context, 50.0),
                  ),
                ),
                ListTile(
                  title: Text(
                    'قيم التطبيق',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.rateApp,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      InOutPageRoute(
                          const RatingScreen(), Alignment.bottomLeft),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'تواصل معنا',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.contactUs,
                    color: AppColors.secondary,
                    width: adjustValue(context, 35.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const ContactUsScreen(), -1, 0),
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: adjustValue(context, 6.0)),
                  child: Divider(
                    color: AppColors.secondary,
                    thickness: 1,
                    indent: adjustValue(context, 50.0),
                    endIndent: adjustValue(context, 50.0),
                  ),
                ),
                ListTile(
                  title: Text(
                    'متابعة الآباء',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.parentsFollowUp,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(Report(), -1, 0),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'إدارة الحساب',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.accountCircle,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      LeftRightPageRoute(const ChildrenProfiles(), -1, 0),
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: adjustValue(context, 6.0)),
                  child: Divider(
                    color: AppColors.secondary,
                    thickness: 1,
                    indent: adjustValue(context, 50.0),
                    endIndent: adjustValue(context, 50.0),
                  ),
                ),
                ListTile(
                  title: Text(
                    'مواد اخرى(Beta)',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.games,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      LeftRightPageRoute(const GamesScreen(), -1, 0),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(
                      color: AppColors.surface,
                      fontFamily: 'Cairo',
                      fontSize: adjustValue(context, 21.0),
                    ),
                  ),
                  leading: SvgPicture.asset(
                    Assets.logout,
                    color: AppColors.secondary,
                    width: adjustValue(context, 40.0),
                  ),
                  onTap: () async {
                    showLoaderDialog(context);
                    try {
                      await prefs.setString('token', "");
                      await prefs.setString('email', "");
                      await prefs.setBool('isLoggedIn', false);
                      await database.deleteAll();

                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        LeftRightPageRoute(const LoginScreen(), -1, 0),
                      );
                    } catch (e) {
                      Navigator.pop(context);
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        );
}
