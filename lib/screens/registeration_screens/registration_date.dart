import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/screen_specific/registration_date/birth_date_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';
import 'package:najme/utility.dart';


class RegistrationBirthDate extends StatefulWidget {
  const RegistrationBirthDate({Key? key}) : super(key: key);
  @override
  _RegistrationBirthDateState createState() => _RegistrationBirthDateState();
}

class _RegistrationBirthDateState extends State<RegistrationBirthDate> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BirthDateButton(
            width: adjustValue(context, 144.0), 
            height: adjustValue(context, 88.0), 
            text: "اليوم"
          ),

          BirthDateButton(
            width: adjustValue(context, 168.0), 
            height: adjustValue(context, 104.0), 
            text: "الشهر"
          ),

          BirthDateButton(
            width: adjustValue(context, 192.0), 
            height: adjustValue(context, 120.0), 
            text: "السنة"
          ),

          SizedBox(
            height: adjustValue(context, 10.0),
          ),
          
          Text(
            "اختر تاريخ ميلادك!",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: adjustValue(context, 50.0),
              fontFamily: 'Cairo',
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),

      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        Navigator.push(
          context, 
          LeftRightPageRoute(const RegistrationLevel(), 1, 0),
        );
      },
    );
  }
}
