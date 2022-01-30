import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/utility.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(adjustHeightValue(context, 15)),
            child: SvgPicture.asset(
              Assets.ok,
              height: adjustHeightValue(context, 140),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(adjustHeightValue(context, 2)),
            child: Text(
              'تم تعديل كلمة السر بنجاح',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'Cairo',
                color: AppColors.primaryDark,
                fontSize: adjustValue(context, 30.0),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: adjustHeightValue(context, 15), bottom: adjustHeightValue(context, 75)),
            child: Text(
              'قم بإستخدامها عند التسجيل المرة القادمة',
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontWeight: FontWeight.w900,
                fontFamily: 'Cairo',
                color: AppColors.primaryDark,
                fontSize: adjustValue(context, 25.0),
              ),
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
                'تم',
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
                  InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
