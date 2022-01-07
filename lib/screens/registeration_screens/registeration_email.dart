import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registration_password.dart';
import 'package:najme/utility.dart';

class RegisterationEmail extends StatelessWidget {
  RegisterationEmail({Key? key}) : super(key: key);

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
    var emailController = TextEditingController();
    return MainContainer(
      child: Stack(
        children: [
          Column(
            children: [
              const Expanded(
                child: SizedBox(),
              ),

              Expanded(
                flex: 2,
                child: SvgPicture.asset(Assets.E),
              ),

              Expanded(
                child: Center(
                  child: FormTextBox(
                    context: context,
                    text: "الايميل",
                    controllerKind: emailController,
                    type: TextInputType.emailAddress,
                  ),
                ),
              ),

              Text(
                "إيميل ولي الأمر",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: adjustValue(context, 50.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                ),
              ),

              const Expanded(
                child: SizedBox(),
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
              onPressed: (){
                Navigator.push(
                  context,
                  LeftRightPageRoute(const LoginScreen(), -1, 0),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (emailController.text != "") {
          registrationData["email"] = emailController.text;
          Navigator.push(
            context, 
            LeftRightPageRoute(RegistrationPassword(registrationData: registrationData), 1, 0),
          );
        }
      },
    );
  }
}
