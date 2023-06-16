import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/_api/api.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/show_loader_dialog.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/confirmation_code.dart';
import 'package:najme/utility.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  String server_code = '';
  final _formKey = GlobalKey<FormState>();
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: MainContainer(
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: Center(
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
                              Assets.E,
                              height: adjustHeightValue(context, 90),
                              width: adjustWidthValue(context, 90),
                            ),
                          ),
                          height: adjustHeightValue(context, 140),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(adjustHeightValue(context, 7)),
                        child: Text(
                          'نسيت كلمة السر!',
                          style: TextStyle(
                            fontSize: adjustValue(context, 33.0),
                            fontFamily: 'Cairo',
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(adjustHeightValue(context, 7)),
                        child: Text(
                          'ادخل إيميلك لإرسال كود التأكيد',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            color: AppColors.primaryDark,
                            fontSize: adjustValue(context, 29.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: adjustHeightValue(context, 15),
                            bottom: adjustHeightValue(context, 40)),
                        child: FormTextBox(
                          context: context,
                          text: "الايميل",
                          controllerKind: emailController,
                          type: TextInputType.emailAddress,
                          valid: (value) {
                            if (!validateEmail(value)) {
                              return "من فضلك ادخل بريد إلكتروني صحيح!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                            color: AppColors.primary,
                            minWidth: double.infinity,
                            height: adjustValue(context, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  adjustValue(context, 15.0)),
                            ),
                            child: Text(
                              'إرسال',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: AppColors.surface,
                                fontSize: adjustValue(context, 26.0),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                showLoaderDialog(context);
                                try {
                                  server_code = await register_email_api(
                                      emailController.text);
                                  print("The code is: $server_code");
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    LeftRightPageRoute(
                                        ConfirmationCode(
                                            email: emailController.text,
                                            server_code: server_code),
                                        1,
                                        0),
                                  );
                                } catch (e) {
                                  Navigator.pop(context);
                                  print(e);
                                }
                              }
                              ;
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: adjustValue(context, 30.0),
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
