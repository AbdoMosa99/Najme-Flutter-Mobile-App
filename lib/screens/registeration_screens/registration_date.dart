import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/screen_specific/registration_date/birth_date_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_gender.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
import 'package:najme/utility.dart';

class RegistrationBirthDate extends StatefulWidget {
  RegistrationBirthDate({
    Key? key,
    required this.registrationData
  }) : super(key: key);

  Map<String, dynamic> registrationData;

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
  @override
  Widget build(BuildContext context) {
    int? dayI;
    int? monthI;
    int? yearI;

    return MainContainer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BirthDateButton(
                width: adjustWidthValue(context, 144.0),
                height: adjustHeightValue(context, 95.0),
                text: "اليوم",
                title: "اختر يوم ميلادك!  ",
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
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: adjustValue(context, 24.0),
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(
                    context,false
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (dayI != null && monthI != null && yearI != null) {
          widget.registrationData["birthdate"] = 
            widget.years[yearI!].toString() + "/" +
            (monthI! + 1).toString() + "/" +
            widget.days[dayI!].toString();
          Navigator.push(
            context,
            LeftRightPageRoute(
              RegistrationLevel(registrationDate: widget.registrationData), 1, 0
            ),
          );
        }
      },
    );
  }
}
