import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/forget_password/new_password.dart';
import 'package:najme/screens/primary_screens/home_screen.dart';
import 'package:najme/utility.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return MainContainer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: adjustHeightValue(context, 50)),
                child: Container(
                  child: Center(
                    child: SvgPicture.asset(
                        Assets.E,
                        height: 90,
                        width: 90,
                    ),
                  ),
                  height:140,
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
                  'ادخل إيميلك لإرسال الكود التأكيد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                    fontSize: adjustValue(context, 33.0),
                  ),
                ),
              ),
              Padding(//
                padding: EdgeInsets.only(bottom: adjustHeightValue(context, 80)),
                child: FormTextBox(
                  context: context,
                  text: "البريد الالكتروني",
                  controllerKind: emailController,
                  type: TextInputType.name,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'نسيت كلمة السر!',
                style: TextStyle(
                  fontSize: adjustValue(context, 33.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: adjustValue(context, 30.0),
                  color: AppColors.primary,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    LeftRightPageRoute(const HomeScreen(), -1, 0),
                  );
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              color: AppColors.primary,
              minWidth: double.infinity,
              height: adjustValue(context, 50),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(adjustValue(context, 15.0)),
              ),
              child: Text(
                'إرسال',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  color: AppColors.surface,
                  fontSize: adjustValue(context, 30.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  InOutPageRoute(const NewPassword(), Alignment.bottomCenter),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
