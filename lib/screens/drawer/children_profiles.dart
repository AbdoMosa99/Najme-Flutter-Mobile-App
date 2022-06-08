import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/back_button.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/drawer/personal_account_updates.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/screens/registeration/registeration_name.dart';
import 'package:najme/utility.dart';

class ChildrenProfiles extends StatelessWidget {
  const ChildrenProfiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.getProfiles(),
      initialData: [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        List<Profile> profiles = snapshot.data!.cast<Profile>();
        return snapshot.hasData
            ? MainContainer(
                child: Stack(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ملفات أطفالك الشخصية',
                          style: TextStyle(
                            fontSize: adjustValue(context, 28.0),
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w900,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: adjustHeightValue(context, 270.0),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: buildList(context, profiles),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: adjustHeightValue(context, 25),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: adjustHeightValue(context, 50.0),
                          child: MainButton(
                            context: context,
                            text: 'أضف ملف لطفل آخر',
                            color: AppColors.primary,
                            onTap: () {
                              Navigator.push(context,
                                  LeftRightPageRoute(RegistrationName(), 1, 0));
                            },
                          ),
                        ),
                      ]),
                  PBackButton(context: context),
                ]),
                floatingActionButton: true,
                floatingActionIcon: Icons.edit_outlined,
                floatingActionIconColor: AppColors.secondary,
                onFloatingActionButtonTap: () {
                  Navigator.push(
                    context,
                    InOutPageRoute(
                        const PersonalAccountUpdates(), Alignment.bottomCenter),
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

List<Widget> buildList(
  BuildContext context,
  List<Profile> profiles,
) {
  List<Widget> list = [];

  for (int i = 0; i < profiles.length; i++) {
    list.add(
      Column(
        children: [
          InkWell(
            child: Container(
              width: double.infinity,
              height: adjustHeightValue(context, 70.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(adjustValue(context, 10.0)),
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: adjustValue(context, 10.0)),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            width: adjustValue(context, 55),
                            height: adjustValue(context, 55),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                          profiles[i].gender == 'ولد'?
                          SvgPicture.asset(
                            Assets.male,
                            height: adjustValue(context, 45.0),
                          ):
                          SvgPicture.asset(
                            Assets.female,
                            height: adjustValue(context, 45.0),
                          )
                        ],
                      )),
                  Text(
                    profiles[i].name,
                    style: TextStyle(
                        fontSize: adjustValue(context, 20.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await prefs.setInt('profile_id', profiles[i].id);
              await init();
              Navigator.pushReplacement(
                context,
                InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
              );
            },
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
  return list;
}
