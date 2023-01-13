import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/screen_specific/personal_profile_updates/list_tile.dart';
import 'package:najme/components/screen_specific/personal_profile_updates/height_sized_box.dart';
import 'package:najme/components/screen_specific/personal_profile_updates/ovalHeader.dart';
import 'package:najme/components/screen_specific/personal_profile_updates/popUpMenuButton.dart';
import 'package:najme/screens/drawer/personal_profile_updates/main_row.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/utility.dart';

class PersonalProfileUpdates extends StatefulWidget {
  const PersonalProfileUpdates({Key? key}) : super(key: key);

  @override
  _PersonalProfileUpdatesState createState() => _PersonalProfileUpdatesState();
}

enum GenderEnum { male, female }

class _PersonalProfileUpdatesState extends State<PersonalProfileUpdates>
    with SingleTickerProviderStateMixin {
  int dayCurrentItemIndex = daysList.indexOf(profile.birthdate.day);
  int monthCurrentItemIndex = profile.birthdate.month - 1;
  int yearCurrentItemIndex = yearsList.indexOf(profile.birthdate.year);
  int levelCurrentItemIndex = levelsList.indexOf(profile.level);
  int countryCurrentItemIndex = countriesList.indexOf(profile.city);
  int futureCurrentItemIndex = futureList.indexOf(profile.ambition);
  GenderEnum? gender = GenderEnum.male;
  TextEditingController nameController =
      TextEditingController(text: profile.name);

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        animationController.reset();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainContainer(
          child: Padding(
            padding: EdgeInsets.only(top: adjustHeightValue(context, 100.0)),
            child: Center(
              child: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RowPersonalUpdates(
                          context: context,
                          title: 'النوع:',
                          widget: ListTileItem(
                            context: context,
                            gender: gender!,
                            list: ['ولد', 'بنت'],
                            values: [GenderEnum.male, GenderEnum.female],
                            onChoose: (GenderEnum? value) {
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                        ),
                        HeightSizedBox(context: context, value: 15),
                        RowPersonalUpdates(
                          key: null,
                          context: context,
                          title: 'تاريخ الميلاد:',
                          widget: Row(
                            children: [
                              Expanded(
                                child: PopUpMenu(
                                  context: context,
                                  initialIndex: dayCurrentItemIndex,
                                  callBack: (value) {
                                    setState(() {
                                      dayCurrentItemIndex = value;
                                    });
                                  },
                                  list: daysList,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                flex: 2,
                                child: PopUpMenu(
                                  context: context,
                                  initialIndex: monthCurrentItemIndex,
                                  callBack: (value) {
                                    setState(() {
                                      monthCurrentItemIndex = value;
                                    });
                                  },
                                  list: monthsList,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                flex: 2,
                                child: PopUpMenu(
                                  context: context,
                                  initialIndex: yearCurrentItemIndex,
                                  callBack: (value) {
                                    setState(() {
                                      yearCurrentItemIndex = value;
                                    });
                                  },
                                  list: yearsList,
                                ),
                              ),
                            ],
                          ),
                        ),
                        HeightSizedBox(context: context, value: 22),
                        RowPersonalUpdates(
                          context: context,
                          title: 'الأسم:',
                          widget: Container(
                              alignment: Alignment.center,
                              height: 50,
                              child: FormTextBox(
                                  context: context,
                                  text: 'الأسم',
                                  controllerKind: nameController)),
                        ),
                        HeightSizedBox(context: context, value: 20),
                        RowPersonalUpdates(
                          key: null,
                          context: context,
                          title: 'المرحلة:',
                          widget: PopUpMenu(
                            context: context,
                            initialIndex: levelCurrentItemIndex,
                            callBack: (value) {
                              setState(() {
                                levelCurrentItemIndex = value;
                              });
                            },
                            list: levelsList,
                          ),
                        ),
                        HeightSizedBox(context: context, value: 20),
                        RowPersonalUpdates(
                          key: null,
                          context: context,
                          title: 'المحافظة:',
                          widget: PopUpMenu(
                            context: context,
                            list: countriesList,
                            initialIndex: countryCurrentItemIndex,
                            callBack: (value) {
                              setState(() {
                                countryCurrentItemIndex = value;
                              });
                            },
                          ),
                        ),
                        HeightSizedBox(context: context, value: 20),
                        RowPersonalUpdates(
                            key: null,
                            context: context,
                            title: 'الطموح:',
                            widget: PopUpMenu(
                              context: context,
                              list: futureList,
                              initialIndex: futureCurrentItemIndex,
                              callBack: (value) {
                                setState(() {
                                  futureCurrentItemIndex = value;
                                });
                              },
                            )),
                        HeightSizedBox(context: context, value: 40),
                        Container(
                          width: double.infinity,
                          height: adjustHeightValue(context, 50.0),
                          child: MainButton(
                            context: context,
                            text: 'حفظ التعديلات',
                            color: AppColors.primary,
                            onTap: () {
                              profile.birthdate = DateTime.utc(
                                yearsList[0] - yearCurrentItemIndex,
                                monthCurrentItemIndex + 1,
                                dayCurrentItemIndex + 1,
                              );
                              profile.ambition =
                                  futureList[futureCurrentItemIndex];
                              profile.city =
                                  countriesList[countryCurrentItemIndex];
                              profile.gender = gendersList[gender!.index];
                              profile.level = levelsList[levelCurrentItemIndex];
                              profile.name = nameController.text;

                              // TODO: Call API Here.
                              database.updateProfile(profile);
                              showDoneDialog();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        OvalHeader(context: context, title: 'تعديل الملف الشخصي')
      ],
    );
  }

  void showDoneDialog() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/lottie/Done.json',
                repeat: false,
                controller: animationController,
                onLoaded: (composition) {
                  animationController.forward();
                },
              ),
              Text(
                'تم بنجاح ',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
}
