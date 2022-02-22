import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import '../../utility.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainContainer(
          child: Padding(
            padding: EdgeInsets.only(top: adjustHeightValue(context, 100.0)),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'تواصل معنا',
                        style: TextStyle(
                          fontSize: adjustValue(context, 40.0),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                      TextFormField(
                        maxLines: 4,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: adjustHeightValue(context, 15.0),
                              horizontal: adjustWidthValue(context, 15.0)),
                          fillColor: AppColors.surface,
                          filled: true,
                          hintText: 'رسالتك ...',
                          hintStyle: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: adjustValue(context, 18.0),
                            color: AppColors.primary,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                adjustValue(context, 15.0)),
                            borderSide: BorderSide(
                              color: AppColors.secondaryLight,
                              width: adjustWidthValue(context, 2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                adjustValue(context, 15.0)),
                            borderSide: const BorderSide(
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: adjustValue(context, 20.0),
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: adjustHeightValue(context, 15)),
                          child: SizedBox(
                            width: adjustHeightValue(context, 100.0),
                            height: adjustHeightValue(context, 50.0),
                            child: MainButton(
                              context: context,
                              text: 'إرسال',
                              color: AppColors.primary,
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'أو راسلنا عبر:',
                          style: TextStyle(
                            fontSize: adjustValue(context, 25.0),
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: SvgPicture.asset(
                              Assets.gmail_contact,
                              height: adjustValue(context, 65.0),
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              Assets.twiter,
                              height: adjustValue(context, 65.0),
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              Assets.watsapp,
                              height: adjustValue(context, 65.0),
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: SvgPicture.asset(
                              Assets.facebock,
                              height: adjustValue(context, 65.0),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: adjustValue(context, 30.0)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.secondary,
                      size: adjustValue(context, 30),
                    ),
                    Text('رجوع',
                        style: TextStyle(
                          fontSize: adjustValue(context, 23.0),
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        )),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(adjustValue(context, 22)),
                    bottomRight: Radius.circular(adjustValue(context, 22)),
                  ),
                  color: AppColors.primary,
                ),
                width: adjustWidthValue(context, 100),
                height: adjustHeightValue(context, 55),
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}
