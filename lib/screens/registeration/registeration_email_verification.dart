import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/forget_password.dart';
import 'package:najme/screens/forget_password/new_password.dart';
import 'package:najme/screens/registeration/registration_password.dart';
import 'package:najme/utility.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../components/screen_specific/registration/registration_topLayer.dart';

class EmailVerificationScreen extends StatefulWidget {
  EmailVerificationScreen({
    Key? key,
    required this.registrationData,
  }) : super(key: key);

  Map<String, dynamic> registrationData;

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Timer? _timer;
  int _start = 11;

  void startTimer() {
    _start = 11;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => startTimer());
  }

  @override
  Widget build(BuildContext context) {

    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(adjustValue(context, 15)),
                      child: SvgPicture.asset(
                            Assets.E2,
                            height: adjustValue(context, 125) ,
                          ),

                    ),
                    Text(
                      'ادخل كود التأكيد الذي وصلك على',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: adjustValue(context, 33.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'kooko@gmail.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                        fontSize: adjustValue(context, 33.0),
                      ),
                    ),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: VerificationCode(
                        textStyle: TextStyle(
                          fontSize: adjustValue(context, 40.0),
                          color: AppColors.secondary,
                          //fontWeight: FontWeight.bold,
                        ),
                        underlineColor: AppColors.primaryDark,
                        keyboardType: TextInputType.number,
                        itemSize: adjustValue(context, 50),
                        length: 5,
                        autofocus: false,
                        underlineWidth: adjustValue(context, 5),
                        onCompleted: (String value) {
                        },
                        onEditing: (bool value) {
                        },
                      ),
                    ),

                    Padding(
                          padding: EdgeInsets.all(adjustHeightValue(context, 15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                 _start == 0 ? TextButton(
                                    onPressed: () {
                                      startTimer();
                                    },
                                    child: Text(
                                      'إعادة إرسال الكود',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: adjustValue(context, 20.0),
                                        color: AppColors.primaryDark,
                                        fontFamily: 'Cairo',
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                             : TextButton(
                                                onPressed: () {

                                                },
                                                child: Text(
                                                  'إعادة إرسال الكود',
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: adjustValue(context, 20.0),
                                                    color: AppColors.primaryDark.withOpacity(0.5),
                                                    fontFamily: 'Cairo',
                                                    decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),

                                  _start < 10 ? Text(
                                                  "(00:0$_start)",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                            fontSize: adjustValue(context, 20.0),
                                                            color: AppColors.primaryDark,
                                                            fontFamily: 'Cairo',
                                                          ),
                                                )
                                              : Text(
                                                  "(00:$_start)",
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                            fontSize: adjustValue(context, 20.0),
                                                            color: AppColors.primaryDark,
                                                            fontFamily: 'Cairo',
                                                          ),
                                                )
                                ]
                        ),

                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        color: AppColors.primary,
                        minWidth: double.infinity,
                        height: adjustValue(context, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(adjustValue(context, 15.0)),
                        ),
                        child: Text(
                          'تأكيد',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.surface,
                            fontSize: adjustValue(context, 26.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            LeftRightPageRoute(RegistrationPassword(registrationData: widget.registrationData), 1, 0),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          TopLayer(
            context: context,
            width: 0.22,
            onPressed: (){
              Navigator.pop(
                  context,false
              );
            },
          ),

        ],
      ),
    );
  }
}