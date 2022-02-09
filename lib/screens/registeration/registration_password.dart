import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration/registeration_email.dart';
import 'package:najme/screens/registeration/registeration_name.dart';

import '../../utility.dart';

class RegistrationPassword extends StatefulWidget {
  RegistrationPassword({
    Key? key,
    required this.registrationData,
  }) : super(key: key);

  Map<String, dynamic> registrationData;

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
          child: Stack(
            children: [
              Center(
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
                                suffIcon: isPassword
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
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: adjustValue(context, 24.0),
                    color: AppColors.primary,
                  ),
                  onPressed: (){
                    Navigator.pop(
                        context,false
                    );
                  },
                ),
              ),
            ],
          ),

          floatingActionButton: true,
          onFloatingActionButtonTap: () {
            if(formkey.currentState!.validate()){
              widget.registrationData["password"] = passController.text;
              Navigator.push(
                context,
                LeftRightPageRoute(RegistrationName(registrationData: widget.registrationData), 1, 0)
              );
            }

          },
        ),
    );
  }
}