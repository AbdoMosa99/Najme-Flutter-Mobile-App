import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/themes/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';

import '../../utility.dart';

class ChildrenProfiles extends StatelessWidget {
  const ChildrenProfiles({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Stack(
    children: [
    MainContainer(
    child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [

      SizedBox(
        height: adjustValue(context, 120.0),
        ),

      Text(
        'ملفات أطفالك الشخصية',
          style:TextStyle(
          fontSize: adjustValue(context, 26.0),
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
          color: AppColors.primary,
            ),
        ),

      Column(
       children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Container(
                  /*decoration: InputDecoration(
                    labelText: ' محمد على',
                    labelStyle:TextStyle(
                    fontSize: adjustValue(context, 17.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primary,
                  ),
                    contentPadding: EdgeInsets.symmetric(vertical: adjustHeightValue(context, 26.0), horizontal: adjustWidthValue(context, 40.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
                      borderSide: const BorderSide(
                      color: AppColors.primaryLight,
                        ),
                    ),
                    fillColor: AppColors.surface,
                    filled: true,
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: adjustValue(context, 45),
                            height: adjustValue(context, 45),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.secondary,),
                             ),
                              ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                Assets.male,
                                height: adjustValue(context, 35.0),
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        ),
                 )
              )
          ],
          ),*/
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
                   color:AppColors.surface,
                   boxShadow: [
                    BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 3), // changes position of shadow
                       ),
                    ],
                    ),
                child:Row(
                  children: [
                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child:Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: adjustValue(context, 45),
                                height: adjustValue(context, 45),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.secondary,),
                                 ),
                                  ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.male,
                                    height: adjustValue(context, 35.0),
                                     ),
                                  ],
                                ),
                              ],
                            ),)),
                    Text(
                  ' محمد على',style:TextStyle(
                    fontSize: adjustValue(context, 17.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primary,
                  ),
                  ),
                  ],
                )
              ),
          ),
       ]
     ),

      Column(
       children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                  /*decoration: InputDecoration(
                    labelText: ' محمد على',
                    labelStyle:TextStyle(
                    fontSize: adjustValue(context, 17.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primary,
                  ),
                    contentPadding: EdgeInsets.symmetric(vertical: adjustHeightValue(context, 26.0), horizontal: adjustWidthValue(context, 40.0)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
                      borderSide: const BorderSide(
                      color: AppColors.primaryLight,
                        ),
                    ),
                    fillColor: AppColors.surface,
                    filled: true,
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: adjustValue(context, 45),
                            height: adjustValue(context, 45),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.secondary,),
                             ),
                              ),
                          Column(
                            children: [
                              SvgPicture.asset(
                                Assets.male,
                                height: adjustValue(context, 35.0),
                                 ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        ),
                 )
              )
          ],
          ),*/
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(adjustValue(context, 15.0)),
                   color:AppColors.surface,
                   boxShadow: [
                    BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: Offset(0, 3), // changes position of shadow
                       ),
                    ],
                    ),
                child:Row(
                  children: [
                    Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child:Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                width: adjustValue(context, 45),
                                height: adjustValue(context, 45),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.secondary,),
                                 ),
                                  ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.male,
                                    height: adjustValue(context, 35.0),
                                     ),
                                  ],
                                ),
                              ],
                            ),)),
                    Text(
                      'ابراهيم على',
                      style:TextStyle(
                        fontSize: adjustValue(context, 17.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primary,
                    ),
                     ),
                      ],
                    )
              ),
          ),
      ]
     ),

      Padding(
          padding: EdgeInsets.all(adjustValue(context, 20)),
              child: Container(
                  width: adjustHeightValue(context, 300.0),
                  height: adjustHeightValue(context, 50.0),
                  child: MainButton(
                    context: context,
                    text: 'أضف ملف لطفل آخر',
                    color: AppColors.primary,
                    onTap: () {
                      },
                  ),
               ),
           ),

      SizedBox(
          height: adjustValue(context,40.0),
       ),

      Container(
         alignment: Alignment.topRight,
         child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.edit_outlined,color: AppColors.secondary,size: 40,),
            backgroundColor: AppColors.primary,)
           )
         ]
        ) ,
     ),
    GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: adjustValue(context, 15.0)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColors.secondary,
                      size: adjustValue(context, 40),
                    ),
                    Text(
                        ' تسجيل الخروج ',
                        style: TextStyle(
                          fontSize: adjustValue(context, 23),
                          fontFamily: 'Cairo',
                          color:AppColors.surface,
                          decoration: TextDecoration.none,
                        )
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(adjustValue(context, 22)),
                    bottomRight: Radius.circular(adjustValue(context, 22)),
                  ),
                  color: AppColors.primary,
                ),
                width: adjustValue(context, 192),
                height: adjustValue(context, 55),

              ),
            ),
          ),
          onTap: (){
            },
        ),
    ]
    );
  }
}
