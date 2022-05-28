import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/dialogs/settings_dialog/settings_row.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/utility.dart';

class SettingsDialog extends StatefulWidget {
  SettingsDialog({Key? key}) : super(key: key);

  @override
  _SettingsDialogState createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool music_on = true;
  bool sounds_on = false;
  bool notifications_on = true;
  bool vibration_on = false;
  static const id = 'SettingsDialog';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: adjustHeightValue(context, 130.0), horizontal: adjustWidthValue(context, 35)),
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(adjustValue(context, 32.0)))),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  color: AppColors.secondary,
                  thickness: 2.0,
                  height: 2.0,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "الإعدادات",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: adjustValue(context, 22.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  width: adjustWidthValue(context, 160.0),
                  height: adjustHeightValue(context, 40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(adjustValue(context, 36.0)),
                      bottomRight: Radius.circular(adjustValue(context, 36.0)),
                    ),
                    color: AppColors.primary,
                  ),
                ),
                settingsRow(
                    context: context,
                    icon: Assets.bgMusic,
                    leadingText: "الموسيقى الخلفية",
                    onChanged: (bool new_value) {
                      setState(() {
                        music_on = new_value;
                      });
                    },
                    value: music_on),
                settingsRow(
                  context: context,
                  icon: Assets.sounds,
                  leadingText: "تأثيرات الصوت",
                  onChanged: (bool new_value) {
                    setState(() {
                      sounds_on = new_value;
                    });
                  },
                  value: sounds_on,
                ),
                settingsRow(
                    context: context,
                    icon: Assets.notification,
                    leadingText: "الإشعارات",
                    onChanged: (bool new_value) {
                      setState(() {
                        notifications_on = new_value;
                      });
                    },
                    value: notifications_on),
                settingsRow(
                    context: context,
                    icon: Assets.vibration,
                    leadingText: "وضع الاهتزاز",
                    onChanged: (bool new_value) {
                      setState(() {
                        vibration_on = new_value;
                      });
                    },
                    value: vibration_on),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: adjustHeightValue(context, 20.0)),
                  child: Divider(
                    color: AppColors.secondary,
                    thickness: 2.0,
                    height: 2.0,
                  ),
                ),
                Container(
                  height: adjustHeightValue(context, 40.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(adjustValue(context, 15.0)),
                    ),
                    color: AppColors.primary,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          InOutPageRoute(HomeScreen(), Alignment.bottomCenter),
                          (route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "الصفحة الرئيسية",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.white,
                            fontSize: adjustValue(context, 20.0),
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: AppColors.secondary,
                          size: adjustValue(context, 40.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryLight.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(-3, 3),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  size: adjustValue(context, 32.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
