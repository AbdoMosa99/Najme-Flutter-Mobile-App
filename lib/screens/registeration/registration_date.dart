import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/screen_specific/registration_date/birth_date_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/registeration/registration_level.dart';
import 'package:najme/utility.dart';

import '../../api/general.dart';
import '../../components/general/error_message.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';

class RegistrationBirthDate extends StatefulWidget {
  RegistrationBirthDate({
    Key? key,
    required this.profileData
  }) : super(key: key);

  Profile profileData;

  final days = [for (var i = 1; i <= 31; i++) i];
  final months = [
    "يناير",
    "فبراير",
    "مارس",
    "إبريل",
    "مايو",
    "يونيو",
    "يوليو",
    "أغسطس",
    "سبتمبر",
    "أكتوبر",
    "نوفمبر",
    "ديسمبر",
  ];
  final years = [for (var i = 2005; i <= 2020; i++) i];

  @override
  _RegistrationBirthDateState createState() => _RegistrationBirthDateState();
}

class _RegistrationBirthDateState extends State<RegistrationBirthDate> {
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    int? dayI;
    int? monthI;
    int? yearI;

    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BirthDateButton(
                  width: adjustWidthValue(context, 144.0),
                  height: adjustHeightValue(context, 95.0),
                  text: "اليوم",
                  title: "اختر يوم ميلادك!",
                  fontSize: 26,
                  data: widget.days,
                  callBack: (int index) {
                    dayI = index;
                  },
                ),
                BirthDateButton(
                  width: adjustWidthValue(context, 168.0),
                  height: adjustHeightValue(context, 113.0),
                  text: "الشهر",
                  title: "اختر شهر ميلادك!",
                  fontSize: 23,
                  data: widget.months,
                  callBack: (int index) {
                    monthI = index;
                  },
                ),
                BirthDateButton(
                  width: adjustWidthValue(context, 192.0),
                  height: adjustHeightValue(context, 125.0),
                  text: "السنة",
                  title: "اختر سنة ميلادك!",
                  fontSize: 27,
                  data: widget.years,
                  callBack: (int index) {
                    yearI = index;
                  },
                ),

                if(!valid) ErrorMessage(
                    context: context,
                    message: "من فضلك ادخل تاريخ ميلادك!",
                    ),


                SizedBox(
                  height: adjustValue(context, 20.0),
                ),
                Text(
                  "اختر تاريخ ميلادك!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: adjustValue(context, 42.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),

          TopLayer(
            context: context,
            width: 0.66,
            onPressed: (){
              Navigator.pop(
                  context,false
              );
            },
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () async {
        if (dayI != null && monthI != null && yearI != null) {
          widget.profileData.birthdate = DateTime.utc(widget.years[yearI!], monthI! + 1, widget.days[dayI!]);
          setState(() {
            valid = true;
          });

          List levels_list = await levels_api();
          Navigator.push(
            context,
            LeftRightPageRoute(
              RegistrationLevel(profileData: widget.profileData, levels_list: levels_list), 1, 0
                ),
              );
        }
        else{
          setState(() {
            valid = false;
          });
        }
      },
    );
  }
}
