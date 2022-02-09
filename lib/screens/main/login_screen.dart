import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/forget_password.dart';
import 'package:najme/screens/registeration/registeration_email.dart';
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
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> LoginData = {
    "loginName": null,
    "loginPass": null,
  };
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Assets.logoName,
                  width: adjustWidthValue(context, 182.17),
                  height: adjustHeightValue(context, 99.68),
                ),
                SizedBox(
                  height: adjustHeightValue(context, 20.0),
                ),
                Image.asset(
                  Assets.rocket,
                  width: adjustWidthValue(context, 220),
                  height: adjustHeightValue(context, 220),
                ),
                SizedBox(
                  height: adjustHeightValue(context, 25.0),
                ),
                FormTextBox(
                  context: context,
                  text: "الاسم",
                  controllerKind: nameController,
                  type: TextInputType.name,
                    valid: (value){
                      if (value == "") {
                        return "من فضلك أدخل الأسم!";
                      }
                      return null;
                    }
                ),
                SizedBox(
                  height: adjustHeightValue(context, 15.0),
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
                  height: adjustHeightValue(context, 35.0),
                ),
                Container(
                  width: double.infinity,
                  height: adjustHeightValue(context, 50.0),
                  child: MainButton(
                    context: context,
                    text: 'دخول',
                    color: AppColors.primary,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        LoginData["loginName"] = nameController.text;
                        LoginData["loginPass"] = passController.text;
                        print(LoginData);
                        Navigator.push(
                          context,
                          InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
                        );
                      }
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
          ),
        ),
      ),
    );
  }
}
