import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/done_screen.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/utility.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var passController1 = TextEditingController();
  var passController2 = TextEditingController();
  bool isPassword1 = true;
  bool isPassword2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: MainContainer(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: adjustHeightValue(context, 30)),
                  child: Container(
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.keys,
                        height: adjustHeightValue(context, 100),
                        width: adjustWidthValue(context, 100),
                      ),
                    ),
                    height: adjustHeightValue(context, 140),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.6),
                      shape: BoxShape.circle,
                      //border: Border.all(color: AppColors.secondary,),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: adjustHeightValue(context, 20)),
                  child: Text(
                    'ادخل كلمة السر الجديدة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: AppColors.primaryDark,
                      fontSize: adjustValue(context, 33.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: adjustHeightValue(context, 40)),
                  child: FormTextBox(
                    context: context,
                    text: "كلمة السر",
                    controllerKind: passController1,
                    type: TextInputType.text,
                    suffIcon: isPassword1
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    ispass: isPassword1,
                    suffixFun: () {
                      setState(() {
                        isPassword1 = !isPassword1;
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
                ),
                FormTextBox(
                  context: context,
                  text: "تأكيد كلمة السر",
                  controllerKind: passController2,
                  type: TextInputType.text,
                  suffIcon: isPassword2
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  ispass: isPassword2,
                  suffixFun: () {
                    setState(() {
                      isPassword2 = !isPassword2;
                    });
                  },
                  valid: (value) {
                    if (value.isEmpty) {
                      return "من فضلك ادخل تأكيد كلمة السر";
                    }
                    if (passController1.text != passController2.text) {
                      return "لا تتطابق مع كلمة السر";
                    }
                    return null;
                  },
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'كلمة السر الجديدة',
                  style: TextStyle(
                    fontSize: adjustValue(context, 33.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: AppColors.primary,
                minWidth: double.infinity,
                height: adjustHeightValue(context, 50),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(adjustValue(context, 15.0)),
                ),
                child: Text(
                  'حفظ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.surface,
                    fontSize: adjustValue(context, 30.0),
                  ),
                ),
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    Navigator.push(
                        context,
                        InOutPageRoute(const DoneScreen(), Alignment.bottomCenter),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
