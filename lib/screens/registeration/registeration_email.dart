import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/main/login_screen.dart';
import 'package:najme/screens/registeration/registeration_email_verification.dart';
import 'package:najme/screens/registeration/registration_password.dart';
import 'package:najme/utility.dart';

import '../../components/screen_specific/registration/registration_topLayer.dart';

class RegisterationEmail extends StatelessWidget {
  RegisterationEmail({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  Map<String, dynamic> registrationData = {
    "email": null,
    "password": null,
    "name": null,
    "gender": null,
    "birthdate": null,
    "level": null,
    "city": null,
    "ambition": null,
  };

  @override
  Widget build(BuildContext context) {
    return MainContainer(
          paddingAll: 0.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(adjustValue(context, 20)),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              Assets.E,
                            height: adjustHeightValue(context, 150),
                          ),
                          SizedBox(
                            height: adjustHeightValue(context, 50),
                          ),
                          FormTextBox(
                            context: context,
                            text: "الايميل",
                            controllerKind: emailController,
                            type: TextInputType.emailAddress,
                            valid: (value) {
                              if (!validateEmail(value)) {
                                return "من فضلك ادخل بريد إلكتروني صحيح!";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: adjustHeightValue(context, 50),
                          ),
                          Text(
                            "إيميل ولي الأمر ",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: adjustValue(context, 40.0),
                              fontFamily: 'Cairo',
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              TopLayer(
                context: context,
                width: 0.11,
                onPressed: (){
                  Navigator.pop(
                      context,false
                  );
                },
              ),
            ],
          ),

          floatingActionButton: true,
          onFloatingActionButtonTap: () {
            if (_formKey.currentState!.validate()) {
              registrationData["email"] = emailController.text;
              Navigator.push(
                context,
                LeftRightPageRoute(EmailVerificationScreen(registrationData: registrationData), 1, 0),
              );
            }
          },
    );
  }
}
