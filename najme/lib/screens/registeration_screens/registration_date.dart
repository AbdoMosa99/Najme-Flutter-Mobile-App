import 'package:flutter/material.dart';
import 'package:najme/components/buttons/birth_date_button.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';

class RegistrationBirthDate extends StatefulWidget {
  const RegistrationBirthDate({Key? key}) : super(key: key);
  @override
    _RegistrationBirthDateState createState() => _RegistrationBirthDateState();
}
class _RegistrationBirthDateState extends State<RegistrationBirthDate> {
  @override
  Widget build(BuildContext context) {
    return mainContainer(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BirthDateButton(
                      width: 144.0,
                      height: 89.0,
                      text: "اليوم"
                  ),
                  BirthDateButton(
                      width: 169.0,
                      height: 105.0,
                      text: "الشهر"
                  ),
                  BirthDateButton(
                      width: 192.0,
                      height: 119.0,
                      text: "السنة"
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Order(
                    question: "اختر تاريخ ميلادك!",
                    size: 50.0,
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

        floutingButton: RightEndButton(
            whenTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistrationLevel()
                ),
              );
            },
        ),
    );
  }
}
