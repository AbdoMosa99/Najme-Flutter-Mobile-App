import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/buttons/main_floating_button.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/components/text_box/form_text_box.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/screens/registeration_screens/registration_date.dart';
import 'package:najme/utility.dart';

class RegisterationEmail extends StatelessWidget {
  const RegisterationEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return MainContainer(
      // a box in which a single widget can be scrolled.
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(adjustValue(context, 30)),
              // Determine the direction " page ,text"
              child: Image(
                image: AssetImage(Assets.E),
                height: adjustValue(context, 108),
                width: adjustValue(context, 108),
              ),
            ),

            SizedBox(
              height: adjustValue(context, 45.0),
            ),

            FormTextBox(
              text: "الايميل",
              length: 20,
              controllerKind: emailController,
              type: TextInputType.emailAddress,
            ),

            SizedBox(
              height: adjustValue(context, 25.0),
            ),

            Order(
              question: "ايميل ولي الأمر!",
              size: adjustValue(context, 50.0),
            ),

            SizedBox(
              height: adjustValue(context, 25.0),
            ),

            /**
                    // create email container
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child:TextFormField(
                          textDirection: TextDirection.rtl,
                          obscureText: false,
                        controller: emailController,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'الايميل',
                          prefixIcon: const Icon(Icons.email_outlined) ,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: AppColors.primaryLight,
                              )),
                          fillColor: AppColors.surface,
                          filled: true,
                          labelStyle: const TextStyle(
                            fontFamily: 'assets/fonts/Cairo-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text(
                      "اكتب ايميل ولى الأمر!",
                      style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 36.0,

                      color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(
                        height: 50.0,
                    ),

                    rightEndButton(
                      whenTap: (){},
                    ),
                        **/
          ],
        ),
      ),

      floutingButton: MainFloatingButton(
        onTap: () {
          Navigator.push(
              context, LeftRightPageRoute(const RegistrationBirthDate(), 1, 0));
        },
      ),
    );
  }
}
