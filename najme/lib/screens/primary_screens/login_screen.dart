import 'package:flutter/material.dart';
import 'package:najme/components/archives/background_image.dart';
import 'package:najme/components/text_box/form_text_box.dart';
import 'package:najme/components/buttons/login_button.dart';
import 'package:najme/components/containers/main_container.dart';
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
        child: mainContainer(
          child: Padding(
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
                            type: TextInputType.text
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        LoginButton(
                            text: 'دخول',
                            color: AppColors.primary
                        ),
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
        )
          
        );
  }
}
