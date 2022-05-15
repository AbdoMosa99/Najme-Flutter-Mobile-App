import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/screens/registeration/registration_address.dart';
import 'package:najme/utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/auth_api.dart';
import '../../components/general/error_message.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';
import '../../data.dart';
import '../../database/init.dart';

class RegistrationJob extends StatefulWidget {
  RegistrationJob({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  Profile profileData;

  @override
  _RegistrationJobState createState() => _RegistrationJobState();
}

class _RegistrationJobState extends State<RegistrationJob> {
  int job = -1;
  bool valid = true;
  TextEditingController ambitionController = TextEditingController();

  get controller => null;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    setState(() {
                                      job = 1;
                                    });
                                  },
                                  image: SvgPicture.asset(Assets.teacher),
                                  text: 'مدرس',
                                  color: job == 1 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 1 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),

                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    setState(() {
                                      job = 2;
                                    });
                                  },
                                  image: SvgPicture.asset(Assets.engineer),
                                  text: 'مهندس',
                                  color: job == 2 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 2 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),

                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    setState(() {
                                      job = 3;
                                    });
                                  },
                                  image: SvgPicture.asset(Assets.policeman),
                                  text: 'ضابط',
                                  color: job == 3 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 3 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 15),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    ambitionController.clear();
                                    showDialog(
                                      context: context, 
                                      builder: (BuildContext context) {
                                        return SimpleDialog( 
                                          contentPadding: EdgeInsets.all(adjustValue(context, 22.0)),
                                          backgroundColor: AppColors.primaryLight,
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: FormTextBox(
                                                context: context,
                                                text: "طموحك",
                                                controllerKind: ambitionController,
                                              ),
                                            ),

                                            SizedBox(
                                              height: adjustHeightValue(context, 16.0),
                                            ),
                                            
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: FloatingActionButton(
                                                backgroundColor: AppColors.secondary,
                                                child: Directionality(
                                                  textDirection: TextDirection.ltr,
                                                  child: Icon(
                                                    Icons.done_outline,
                                                    size: adjustValue(context, 20.0),
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                                onPressed: (){
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    job = 6;
                                                  });
                                                },
                                              ),
                                            ),
                      
                                            ],
                                        );
                                      },
                                    );
                                  },
                                  image: SvgPicture.asset(Assets.plusSign, color: AppColors.secondary,),
                                  text: ambitionController.text == '' ? 'أخرى' : ambitionController.text,
                                  color: job == 6 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 6 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),

                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    setState(() {
                                      job = 4;
                                    });
                                  },
                                  image: SvgPicture.asset(Assets.doctor),
                                  text: 'طبيب',
                                  color: job == 4 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 4 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),

                            Expanded(
                              child: AspectRatio(
                                aspectRatio: 3 / 4,
                                child: MainCard(
                                  context: context,
                                  onTap: () {
                                    setState(() {
                                      job = 5;
                                    });
                                  },
                                  image: SvgPicture.asset(Assets.programmer),
                                  text: 'مبرمج',
                                  color: job == 5 ? AppColors.primary : AppColors.surface,
                                  textColor: job == 5 ? AppColors.white : AppColors.primary,
                                  fontSize: 16,
                                  stroke: true,
                                ),
                              ),
                            ),

                          ],
                        ),
                        if(!valid) ErrorMessage(
                          context: context,
                          message: "من فضلك اختر طموحك",
                      ),
                      ],
                    ),
                    SizedBox(
                      height: adjustHeightValue(context, 60),
                    ),
                    Text(
                      "ما هو طموحك!",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: adjustValue(context, 40.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                      ),
                    ),
                    SizedBox(
                      height: adjustHeightValue(context, 40),
                    ),
                    MaterialButton(
                      color: AppColors.primary,
                      minWidth: double.infinity,
                      height: adjustValue(context, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(adjustValue(context, 15.0)),
                      ),
                      child: Text(
                        'تسجيل',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.surface,
                          fontSize: adjustValue(context, 30.0),
                        ),
                      ),
                      onPressed: () async {
                        if (job != -1) {
                          widget.profileData.ambition = futureList[job-1];

                           setState(() {
                            valid = true;
                          });
                          showDoneDialog();
                          // TODO: Call API
                          prefs = await SharedPreferences.getInstance();

                          String token = prefs.getString('token')!;

                          Profile profile = await create_profile_api(token, widget.profileData);

                          await database.insertProfile(profile);
                          await prefs.setInt('profile_id',profile.id);

                          /*
                          Progress progress = await get_progress_api(token, profile.id);
                          await database.insertProgress(progress);

                          List<Subject> subjects = await get_subjects_api(token, profile.id);
                          subjects.forEach((subject) async{
                            await database.insertSubject(subject);

                            List<Unit> units = await get_units_api(token, subject.id);
                            units.forEach((unit) async{
                              await database.insertUnit(unit);
                            });
                          });
                           */

                          await prefs.setBool('isLoggedIn', true);

                          await init();

                          print(widget.profileData);
                          Navigator.push(
                            context,
                            InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
                          );
                        }
                        else{
                          setState(() {
                            valid = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          TopLayer(
            context: context,
            width: 1,
            onPressed: (){
              Navigator.pop(
                  context,false
              );
            },
          ),
        ],
      ),  
    );
  }

  void showDoneDialog() => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) =>Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/lottie/Done.json',
            repeat: false,     
            controller: controller, 
            onLoaded: (composition){
              controller.forward();
            },                   
          ),
          Text(
            'تم بنجاح ',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
        ],
      ),
    ) ,
  );
}
