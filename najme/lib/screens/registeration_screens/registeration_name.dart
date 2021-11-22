import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/components/text/registration_question.dart';
import 'package:najme/components/text_box/form_text_box.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
class RegistrationName extends StatelessWidget {
  const RegistrationName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    return MainContainer(
         // a box in which a single widget can be scrolled.
          child:SingleChildScrollView(
           child: Column(
             children: [
                const Padding(
                   padding: EdgeInsets.all(30),
                // Determine the direction " page ,text"
                   child: Image(
                   image: AssetImage(Assets.child),
                ),
                ),

                const SizedBox(
                    height: 45.0,
                    ),
               //Create name container
                FormTextBox(
                    text: "الأسم",
                    length: 20,
                    controllerKind: nameController,
                    type: TextInputType.name,
                      ),

                const SizedBox(
                      height: 25.0,
                    ),

                Order(
                      question: "اسم الطفل!",
                      size: 50.0,
                    ),

                const SizedBox(
                     height: 25.0,
                    ),
                  ],
                ),
              ),

          floutingButton: RightEndButton(
            whenTap: (){
              Navigator.push(
                context,
                LeftRightPageRoute(const RegisterationEmail(), 1, 0)
              );
            },
          ),
    );
  }
}
