import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/text_box/form_text_box.dart';
import 'package:najme/components/buttons/main_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_name.dart';
import 'home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            child: SvgPicture.asset(Assets.nagmiName)
            ),

          Expanded(
            flex: 2, 
            child: SvgPicture.asset(Assets.launchImg)
            ),

          FormTextBox(
            text: "الأسم",
            length: 20,
            controllerKind: nameController,
            type: TextInputType.name,
          ),

          FormTextBox(
            text: "كلمة السر",
            length: 8,
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
            child: MainButton(
              text: 'دخول',
              color: AppColors.primary,
              onTap: () {
                Navigator.push(context,
                  InOutPageRoute(const HomeScreen(), Alignment.bottomCenter));
              },
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                child: Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        InOutPageRoute(const RegistrationName(),
                            Alignment.bottomRight
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
                ),
              ),

              Expanded(
                child: Container(
                  //alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'نسيت كلمة السر؟',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: adjustValue(context, 20.0),
                        color: AppColors.primaryDark,
                        fontFamily: 'Cairo',
                      ),
                    ),
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
