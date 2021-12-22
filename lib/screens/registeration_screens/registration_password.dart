import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
import 'package:najme/screens/registeration_screens/registeration_name.dart';

import '../../utility.dart';

class RegistrationPassword extends StatefulWidget {
  const RegistrationPassword({Key? key}) : super(key: key);

  @override
  _RegistrationPasswordState createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confpassController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
    key: formkey,
      child: MainContainer(

        child: Stack(
        children: [
          Column(
            children: [

              Expanded(
              flex: 3,
                child: SvgPicture.asset(Assets.lock, width: adjustWidthValue(context, 170), height: adjustHeightValue(context, 170),),
              ),

              FormTextBox(
                    context: context,
                    text: "كلمة السر",
                    controllerKind: passController,
                    type: TextInputType.text,
                    suffIcon: isPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    ispass: isPassword,
                    suffixFun: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    valid: (value){
                      if(value.isEmpty){
                        return "من فضلك ادخل كلمة السر";
                      }
                      if(value.length < 8) {
                        return "يجب أن يكون عدد الحروف على الاقل 8";
                      }
                      return null;
                    },
                  ),

              SizedBox(
                height: adjustHeightValue(context, 24.0),
              ),

              FormTextBox(
                  context: context,
                  text: "تأكيد كلمة السر",
                  controllerKind: confpassController,
                  type: TextInputType.text,
                  suffIcon: isPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  ispass: isPassword,
                  suffixFun: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  valid: (value) {
                    if (value.isEmpty) {
                      return "من فضلك ادخل تأكيد كلمة السر";
                    }
                    if (passController.text != confpassController.text) {
                      return "لا تتطابق مع كلمة السر";
                    }
                    return null;
                  },
                ),

              Expanded(
              flex: 2,
                child: Text(
                  "اكتب كلمة السر!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: adjustValue(context, 50.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                  ),
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
              onPressed: (){
                Navigator.push(
                  context,
                  LeftRightPageRoute(const RegisterationEmail(), -1, 0),
                );
              },
            ),
          ),
        ],

        ),

        floatingActionButton: true,
        onFloatingActionButtonTap: () {
          if(formkey.currentState!.validate()){

            Navigator.push(
              context,
              LeftRightPageRoute(const RegistrationName(), 1, 0)
            );
          }

        },
      ),
    );
  }
}
