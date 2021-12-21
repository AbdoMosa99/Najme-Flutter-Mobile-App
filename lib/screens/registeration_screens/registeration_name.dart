import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/primary_screens/login_screen.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
import 'package:najme/utility.dart';

class RegistrationName extends StatelessWidget {
  const RegistrationName({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return MainContainer(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: adjustHeightValue(context, 48.0),
              ),

              Expanded(
                child: SvgPicture.asset(Assets.child),
              ),

              Expanded(
                child: Center(
                  child: FormTextBox(
                    context: context,
                    text: "الأسم",
                    controllerKind: nameController,
                    type: TextInputType.name,
                  ),
                ),
              ),

              Expanded(
                child: Text(
                  "اسم الطفل",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: adjustValue(context, 50.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                  ),
                ),
              ),

              SizedBox(
                height: adjustValue(context, 25.0),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
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
        Navigator.push(
          context, 
          LeftRightPageRoute(const RegisterationEmail(), 1, 0),
        );
      },
    );
  }
}
