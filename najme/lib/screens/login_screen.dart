import 'package:flutter/material.dart';
import 'package:najme/components/background_image.dart';
import 'package:najme/components/form_text_box.dart';
import 'package:najme/components/login_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var nameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: BackgroundImage(
          null,  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage(Assets.nagmiName),
                    height: 99.68,
                    width: 182.17,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Center(
                  child: Image(
                    image: AssetImage(Assets.lunchImg),
                    height: 200,
                    width: 200,
                    //alignment: Alignment(114.83, 46.59),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                FormTextBox(
                    null, "الأسم", 20, nameController, TextInputType.name),
                const SizedBox(
                  height: 3.5,
                ),
                FormTextBox(
                    null, "كلمة السر", 8, passController, TextInputType.text),
                const SizedBox(
                  height: 25.0,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                LoginButton(null, 'دخول', AppColors.primary),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Padding(
                        padding:  EdgeInsets.only(left: 30),
                        child:  Text(
                          'تسجيل',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: AppColors.primaryDark,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 35.0),
                    TextButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Text(
                          'نسيت كلمة السر؟',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20.0,
                            color: Color(0xFF000063),
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ))),
          ),
          
        )));
  }
}
