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

      var textController=TextEditingController();

    return Stack(
    children: [
        MainContainer(
         child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: adjustValue(context, 50.0),
              ),
              Text(
                'تواصل معنا',
                style:TextStyle(
                    fontSize: adjustValue(context, 40.0),
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: adjustValue(context, 15)),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                       labelStyle: TextStyle(
                        fontSize: adjustValue(context, 16.0),
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                       ),
                       contentPadding: EdgeInsets.symmetric(vertical: adjustHeightValue(context, 70.0), horizontal: adjustWidthValue(context, 120.0)),
                       border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(adjustValue(context, 10.0)),
                          borderSide: const BorderSide(
                          color: AppColors.primaryLight,
                       ),
                 ),
                       fillColor: AppColors.surface,
                       filled: true,
                       labelText: 'رسالتك...',
                   )
                 ),
               ),

             ),
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                   padding: EdgeInsets.symmetric(vertical: adjustValue(context, 15)),
                  child:SizedBox(
                     width: adjustHeightValue(context, 100.0),
                     height: adjustHeightValue(context, 50.0),
                     child: MainButton(
                       context: context,
                       text: 'ارسال',
                       color: AppColors.primary,
                       onTap: () {
                       },
                    ),
                   ),
               ),
             ),
              Container(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
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
             ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: adjustValue(context, 4.0)),
                child: Row(
                  children: [
                    Stack(
                       alignment: AlignmentDirectional.center,
                       children: [
                          Container(
                             width: adjustValue(context, 65),
                             height: adjustValue(context, 65),
                             decoration: BoxDecoration(
                                 color: AppColors.primaryLight,
                                 shape: BoxShape.circle,
                                 border: Border.all(color: AppColors.secondary,),
                                     ),
                                   ),
                          Column(
                             children: [
                                SvgPicture.asset(
                                     Assets.gmail,
                                     height: adjustValue(context, 55.0),
                                      ),
                                   ],
                                 ),
                               ],
                             ),
                    SizedBox(
                     width: adjustValue(context, 20.0),
        ),
                    SvgPicture.asset(
                        Assets.twiter,
                        height: adjustValue(context, 65.0),
                      ),
                    SizedBox(
                     width: adjustValue(context, 20.0),
                       ),
                    SvgPicture.asset(
                        Assets.watsapp,
                        height: adjustValue(context, 65.0),
                      ),
                    SizedBox(
                     width: adjustValue(context, 20.0),
                       ),
                    SvgPicture.asset(
                        Assets.facebock,
                        height: adjustValue(context, 65.0),
                      ),
                   ],
                 ),
               ),
            ],
        ),
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
                      Icons.arrow_back_ios,
                      color: AppColors.secondary,
                      size: adjustValue(context, 30),
                    ),
                    Text(
                        ' رجوع ',
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
                width: adjustValue(context, 100),
                height: adjustValue(context, 50),

              ),
            ),
          ),
          onTap: (){
            },
        ),
     ],
    );
  }
}
