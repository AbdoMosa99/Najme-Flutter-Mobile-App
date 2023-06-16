import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/_api/auth.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/show_loader_dialog.dart';
import 'package:najme/components/screen_specific/registration/registration_topLayer.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration/registeration_email_verification.dart';
import 'package:najme/utility.dart';

class RegisterationEmail extends StatefulWidget {
  RegisterationEmail({Key? key}) : super(key: key);

  @override
  State<RegisterationEmail> createState() => _RegisterationEmailState();
}

class _RegisterationEmailState extends State<RegisterationEmail> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  String server_code = '';

  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        Assets.E,
                        height: adjustHeightValue(context, 150),
                      ),
                      SizedBox(
                        height: adjustHeightValue(context, 50),
                      ),
                      FormTextBox(
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
                      SizedBox(
                        height: adjustHeightValue(context, 50),
                      ),
                      Text(
                        "إيميل ولي الأمر ",
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
              ),
            ),
          ),
          TopLayer(
            context: context,
            width: 0.11,
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () async {
        // navigate to your desired page
        if (_formKey.currentState!.validate()) {
          showLoaderDialog(context);
          try {
            server_code = await register_email_api(emailController.text);
            print("The code is: $server_code");

            Navigator.pop(context);

            Navigator.push(
              context,
              LeftRightPageRoute(
                  EmailVerificationScreen(
                      email: emailController.text, server_code: server_code),
                  1,
                  0),
            );
          } catch (e) {
            Navigator.pop(context);
            print(e);
          }
        }
      },
    );
  }
}
