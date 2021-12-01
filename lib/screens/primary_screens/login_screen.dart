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
            child: FractionallySizedBox(
              heightFactor: 0.8,
              child: Column(
                children: [
                  Expanded(flex: 1, child: SvgPicture.asset(Assets.nagmiName)),
                  Expanded(flex: 2, child: SvgPicture.asset(Assets.lunchImg)),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 30.0,
          // ),
          FormTextBox(
            text: "الأسم",
            length: 20,
            controllerKind: nameController,
            type: TextInputType.name,
          ),
          const SizedBox(
            height: 3.5,
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
          const SizedBox(
            height: 20.0,
          ),
          MainButton(
            text: 'دخول',
            color: AppColors.primary,
            onTap: () {
              Navigator.push(context,
                  InOutPageRoute(const HomeScreen(), Alignment.bottomCenter));
            },
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'نسيت كلمة السر؟',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20.0,
                          color: AppColors.primaryDark,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            InOutPageRoute(const RegistrationName(),
                                Alignment.bottomRight));
                      },
                      child: const Text(
                        'تسجيل',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: AppColors.primaryDark,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
