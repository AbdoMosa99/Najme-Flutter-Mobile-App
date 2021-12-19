import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class MainDrawer extends Drawer {
  MainDrawer({ 
    Key? key,
    required BuildContext context,
  }) 
  : 
  super(
    key: key,
    child: Container(
      color: AppColors.primary,
      margin: EdgeInsets.zero,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: adjustHeightValue(context, 160.0),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryLight,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SvgPicture.asset(Assets.male)
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الاسم',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.surface,
                            fontFamily: 'Cairo',
                            fontSize: adjustValue(context, 30.0),
                          ),
                        ),
                        Text(
                          'المرحلة',
                          maxLines: 1,
                          style: TextStyle(
                            color: AppColors.surface,
                            fontFamily: 'Cairo',
                            fontSize: adjustValue(context, 15.0),
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
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.faceBlack,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text(
              'متابعة الآباء',
              style: TextStyle(
                color: AppColors.surface,
                fontFamily: 'Cairo',
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.parentsFollowUp,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text(
              'الإعدادات',
              style: TextStyle(
                color: AppColors.surface,
                fontFamily: 'Cairo',
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.settings,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: adjustValue(context, 16.0)),
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
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.rateApp,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text(
              'تواصل معنا',
              style: TextStyle(
                color: AppColors.surface,
                fontFamily: 'Cairo',
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.contactUs,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: adjustValue(context, 16.0)),
            child: Divider(
              color: AppColors.secondary,
              thickness: 1,
              indent: adjustValue(context, 50.0),
              endIndent: adjustValue(context, 50.0),
            ),
          ),

          ListTile(
            title: Text(
              'إدارة الحساب',
              style: TextStyle(
                color: AppColors.surface,
                fontFamily: 'Cairo',
                fontSize: adjustValue(context, 20.0),
              ),
            ),
            leading: SvgPicture.asset(
              Assets.accountCircle,
              color: AppColors.secondary,
              width: adjustValue(context, 50.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );

  
}