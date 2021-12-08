import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/buttons/birth_date_button.dart';
import 'package:najme/components/buttons/main_floating_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            BirthDateButton(
              width: adjustValue(context, 144.0), 
              height: adjustValue(context, 89.0), 
              text: "اليوم"
            ),

            BirthDateButton(
              width: adjustValue(context, 169.0), 
              height: adjustValue(context, 105.0), 
              text: "الشهر"
            ),

            BirthDateButton(
              width: adjustValue(context, 192.0), 
              height: adjustValue(context, 119.0), 
              text: "السنة"
            ),

            SizedBox(
              height: adjustValue(context, 10.0),
            ),
            
            Order(
              question: "اختر تاريخ ميلادك!",
              size: adjustValue(context, 50.0),
            ),
            /**
                  const Text(
                    "اختر تاريخ ميلادك!",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: 64.0,
                      fontFamily: 'Cairo',
                    ),
                  ),
                      **/
          ],
        ),
      ),
      floutingButton: MainFloatingButton(
        onTap: () {
          Navigator.push(
              context, LeftRightPageRoute(const RegistrationLevel(), 1, 0));
        },
      ),
    );
  }
}
