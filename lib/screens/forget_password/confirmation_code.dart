import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/new_password.dart';
import 'package:najme/utility.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class ConfirmationCode extends StatefulWidget {
  const ConfirmationCode({Key? key}) : super(key: key);

  @override
  State<ConfirmationCode> createState() => _ConfirmationCodeState();
}

class _ConfirmationCodeState extends State<ConfirmationCode> {
  Timer? timer;
  int _start = 11;

  void startTimer() {
    _start = 11;
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
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
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(adjustHeightValue(context, 15)),
                    child: Container(
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.mailBox,
                          height: adjustHeightValue(context, 135),
                          width: adjustWidthValue(context, 135),
                        ),
                      ),
                      height: adjustHeightValue(context, 140),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    'ادخل كود التأكيد الذي وصلك على',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: adjustValue(context, 33.0),
                      fontFamily: 'Cairo',
                      color: AppColors.primaryDark,
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
                      ),
                      underlineColor: AppColors.primaryDark,
                      keyboardType: TextInputType.number,
                      itemSize: adjustValue(context, 50),
                      length: 5,
                      autofocus: false,
                      underlineWidth: adjustValue(context, 5),
                      onCompleted: (String value) {},
                      onEditing: (bool value) {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(adjustHeightValue(context, 15)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _start == 0
                              ? TextButton(
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
                                  onPressed: () {},
                                  child: Text(
                                    'إعادة إرسال الكود',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: adjustValue(context, 20.0),
                                      color: AppColors.primaryDark
                                          .withOpacity(0.5),
                                      fontFamily: 'Cairo',
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                          _start < 10
                              ? Text(
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
                        ]),
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
                          InOutPageRoute(
                              const NewPassword(), Alignment.bottomCenter),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: adjustValue(context, 30.0),
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
