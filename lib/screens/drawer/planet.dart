import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/back_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class PlanetScreen extends StatelessWidget {
  const PlanetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: AppColors.planetColor,
              body: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 30.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 50.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 30.0),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 30.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 30.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: adjustValue(context, 40.0),
                      ),
                      Center(
                        child: SvgPicture.asset(
                          Assets.planet,
                        ),
                      ),
                    ],
                  ),
                  PBackButton(context: context, color: AppColors.secondary,),
                ],
              ),
            )));
  }
}
