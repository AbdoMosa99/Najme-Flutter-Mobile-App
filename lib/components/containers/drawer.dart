import 'package:flutter/material.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Your_Name'),
                    Text('Your_Level')
                  ],
                ),

                Image.asset(Assets.male),
              ],
            ),
          ),

          ListTile(
            title: Text('الملف الشخصي'),
            leading: Image.asset(Assets.accountCircle),
            onTap: () {
            Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('متابعة الآباء'),
            leading: Image.asset(Assets.parents_follow_up),
            onTap: () {
            Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('الإعدادات'),
            leading: Image.asset(Assets.settings),
            onTap: () {
            Navigator.pop(context);
            },
          ),

          Divider(
            color: AppColors.secondary,
            thickness: 1,
          ),

          ListTile(
            title: Text('قيم التطبيق'),
            leading: Image.asset(Assets.rate_the_app),
            onTap: () {
            Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text('تواصل معنا'),
            leading: Image.asset(Assets.contact_us),
            onTap: () {
            Navigator.pop(context);
            },
          ),

          Divider(
            color: AppColors.secondary,
            thickness: 1,
          ),

          ListTile(
            title: Text('تسجيل خروج'),
            leading: Image.asset(Assets.logout),
            onTap: () {
            Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );

  
}