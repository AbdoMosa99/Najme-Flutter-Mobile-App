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
                            height: adjustValue(context, 20.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 40.0),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 20.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 35.0),
                          ),
                          SvgPicture.asset(
                            Assets.rateStar,
                            height: adjustValue(context, 20.0),
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
                            height: adjustValue(context, 28.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: adjustValue(context, 20.0),
                      ),
                      Center(
                        child: Image.asset(
                          Assets.planet,
                          height: adjustHeightValue(context, 350),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      PBackButton(
                        context: context,
                        color: AppColors.secondary,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                            Image.asset(Assets.small_store,
                                height: adjustHeightValue(context, 60)),
                            Column(
                              children: [
                                Text(
                                  'جزيرة',
                                  style: TextStyle(
                                    fontSize: adjustValue(context, 10.0),
                                    fontFamily: 'Cairo',
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'المتاجر',
                                  style: TextStyle(
                                    fontSize: adjustValue(context, 10.0),
                                      fontFamily: 'Cairo',
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                                            
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Row(
                              children: [
                                SvgPicture.asset(Assets.stars_box),
                                Column(
                                  children: [
                                    Text(
                                      'صندوق',
                                      style: TextStyle(
                                          fontSize: adjustValue(context, 10.0),
                                          fontFamily: 'Cairo',
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'النجوم',
                                      style: TextStyle(
                                          fontSize: adjustValue(context, 10.0),
                                          fontFamily: 'Cairo',
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                        
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.next,
                            height: adjustHeightValue(context, 15),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Image.asset(Assets.saving,
                                height: adjustHeightValue(context, 60)),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )));
  }
}
