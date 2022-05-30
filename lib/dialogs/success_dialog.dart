import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/question/choosing_theme.dart';
import 'package:najme/screens/question/order_game.dart';
import 'package:najme/utility.dart';

showsuccessDialog(BuildContext context) {
  return Stack(alignment: Alignment.center, children: [
    Center(
      child: SimpleDialog(
        backgroundColor: AppColors.surface,
        contentPadding: EdgeInsetsDirectional.only(
          bottom: adjustValue(context, 30),
          top: adjustValue(context, 50),
        ),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.success_star,
                    width: adjustWidthValue(context, 105),
                    height: adjustHeightValue(context, 105),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: adjustHeightValue(context, 70.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      Assets.xLighting,
                      width: adjustWidthValue(context, 60),
                      height: adjustHeightValue(context, 60),
                    ),
                    SvgPicture.asset(
                      Assets.lighting,
                      width: adjustWidthValue(context, 60),
                      height: adjustHeightValue(context, 60),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              '!أحسنت',
              style: TextStyle(
                color: Colors.black,
                fontSize: adjustValue(context, 25),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Center(
            child: Text(
              '!لقد ربحت نجمة أخرى',
              style: TextStyle(
                color: Colors.black,
                fontSize: adjustValue(context, 20),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: adjustHeightValue(context, 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: adjustWidthValue(context, 80),
                child: FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Icon(
                      Icons.arrow_back,
                      size: adjustValue(context, 30.0),
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      InOutPageRoute(const OrderGame(), Alignment.bottomCenter),
                    );
                  },
                ),
              ),
              SizedBox(
                width: adjustWidthValue(context, 80),
                child: FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Icon(
                      Icons.refresh_outlined,
                      size: adjustValue(context, 30.0),
                      color: AppColors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            adjustValue(context, 30),
          ),
          bottomRight: Radius.circular(
            adjustValue(context, 30),
          ),
          topRight: Radius.circular(
            adjustValue(context, 150),
          ),
          topLeft: Radius.circular(
            adjustValue(context, 150),
          ),
        )),
      ),
    ),
    Padding(
        padding: EdgeInsets.only(
          top: adjustHeightValue(context, 370.0),
        ),
        child: SizedBox(
          width: adjustWidthValue(context, 180),
          height: adjustHeightValue(context, 50),
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
            ),
            color: AppColors.primary,
            onPressed: () {
              Navigator.push(
                context,
                InOutPageRoute(const ChoosingTheme(), Alignment.bottomCenter),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'الدرس التالي',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    color: AppColors.white,
                    fontSize: adjustValue(context, 20.0),
                  ),
                ),
                SvgPicture.asset(
                  Assets.double_arrow,
                  width: adjustWidthValue(context, 30),
                  height: adjustHeightValue(context, 30),
                ),
              ],
            ),
          ),
        )),
    Padding(
      padding: EdgeInsets.only(
        bottom: adjustValue(context, 255.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            Assets.banner,
            width: adjustWidthValue(context, 512),
            height: adjustHeightValue(context, 512),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: adjustValue(context, 60)),
            child: Text(
              '!تهانينا',
              style: TextStyle(
                color: AppColors.white,
                fontSize: adjustValue(context, 30),
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    ),
  ]);
                       
  }