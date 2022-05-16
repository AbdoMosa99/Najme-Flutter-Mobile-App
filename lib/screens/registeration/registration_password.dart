import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration/registeration_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/auth.dart';
import '../../components/general/show_loader_dialog.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';
import '../../data.dart';
import '../../utility.dart';

class RegistrationPassword extends StatefulWidget {
  RegistrationPassword({
    Key? key,
    required this.email,
  }) : super(key: key);

  String email;

  @override
  _RegistrationPasswordState createState() => _RegistrationPasswordState();
}

class _RegistrationPasswordState extends State<RegistrationPassword> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confpassController = TextEditingController();
  bool isPassword = true;
  bool isConfPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
        child: MainContainer(
          paddingAll: 0.0,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(adjustValue(context, 20)),
                child: Center(
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.lock,
                              height: adjustHeightValue(context, 170),
                            ),
                            Column(
                              children: [
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
                                  suffIcon: isConfPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  ispass: isConfPassword,
                                  suffixFun: () {
                                    setState(() {
                                      isConfPassword = !isConfPassword;
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
                              ],
                            ),
                            Text(
                              "اكتب كلمة السر!",
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: adjustValue(context, 40.0),
                                fontFamily: 'Cairo',
                                color: AppColors.primaryDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              TopLayer(
                context: context,
                width: 0.33,
                onPressed: (){
                  int count = 0;
                  Navigator.of(context).popUntil((_) => count++ >= 2);
                },
              ),

            ],
          ),

          floatingActionButton: true,
          onFloatingActionButtonTap: () async {
            if(formkey.currentState!.validate()){
                showLoaderDialog(context);
                print(widget.email);
                print(passController.text);
                try{
                  String token = await register_password_api(widget.email, passController.text);

                  prefs = await SharedPreferences.getInstance();
                  await prefs.setString('token', token);
                  await prefs.setString('email', widget.email);

                  print("The token is: $token");
                }
                catch(e){
                  print(e);
                }
                Navigator.pop(context);

              Navigator.push(
                context,
                LeftRightPageRoute(RegistrationName(), 1, 0)
              );
            }

          },
        ),
    );
  }
}
