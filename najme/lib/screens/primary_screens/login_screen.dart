import 'package:flutter/material.dart';
import 'package:najme/components/text_box/form_text_box.dart';
import 'package:najme/components/buttons/login_button.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registeration_name.dart';
import 'home_screen.dart';

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
    return mainContainer(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage(Assets.lunchImg),
                      height: 200,
                      width: 200,
                            //alignment: Alignment(114.83, 46.59),
                    ),
                  ),

                  const SizedBox(
                    height: 30.0,
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
                    height: 20.0,
                  ),

                  LoginButton(
                    text: 'دخول',
                    color: AppColors.primary,
                    whenTap: (){
                      print(nameController.text);
                      print(passController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()
                            ),
                           );
                          },
                        ),

                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
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
                                //decoration: TextDecoration.underline,
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
                                MaterialPageRoute(
                                    builder: (context) => RegistrationName()
                                      ),
                                    );
                                  },
                                  child: const Text(
                                      'تسجيل',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        //decoration: TextDecoration.underline,
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
                ],
              )
          ),
    );
  }
}
