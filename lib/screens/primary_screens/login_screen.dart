import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/forget_password.dart';
import 'package:najme/screens/registeration_screens/registeration_email.dart';
import 'home_screen.dart';
import 'package:najme/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        children: [
          
          Expanded(
            flex: 1,
              child: Image.asset(
                Assets.logoName,
                width: adjustWidthValue(context, 182.17),
                height: adjustHeightValue(context, 99.68),
              )
            ),

          SizedBox(
            height: adjustValue(context, 20.0),
          ),

          Expanded(
            flex: 2,
              child: Image.asset(
                Assets.rocket,
                width: adjustWidthValue(context, 175.47),
                height: adjustHeightValue(context, 175.47),
              )
          ),

          SizedBox(
            height: adjustValue(context, 10.0),
          ),

          FormTextBox(
            context: context,
            text: "الاسم",
            controllerKind: nameController,
            type: TextInputType.name,
          ),

          SizedBox(
            height: adjustValue(context, 10.0),
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
          ),

          SizedBox(
            height: adjustValue(context, 20.0),
          ),

          Container(
            width: double.infinity,
            height: adjustHeightValue(context, 50.0),
            child: MainButton(
              context: context,
              text: 'دخول',
              color: AppColors.primary,
              onTap: () {
                Navigator.push(
                  context,
                  InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    InOutPageRoute(
                      RegisterationEmail(),
                      Alignment.bottomRight,
                    )
                  );
                },
                child: Text(
                  'تسجيل',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: adjustValue(context, 20.0),
                    color: AppColors.primaryDark,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),

              TextButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      InOutPageRoute(const ForgetPassword(), Alignment.bottomCenter),
                    );
                  },
                child: Text(
                  'نسيت كلمة السر؟',
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: adjustValue(context, 20.0),
                    color: AppColors.primaryDark,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ],  
          ),
        ],
      ),
    );
  }
}
