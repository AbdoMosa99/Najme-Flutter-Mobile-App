import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/CA/Features/Home/Cubit/home_cubit.dart';
import 'package:najme/CA/Features/Home/Cubit/home_states.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/main_button.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/main_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/screens/browsing/units_screen.dart';
import 'package:najme/utility.dart';

import '../../../../components/general/drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return MainContainer(
          appBar: MainAppBar(
            context: context,
          ),
          // drawer: MainDrawer(
          //   context: context,
          // ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'مرحباً بك!',
                    style: TextStyle(
                      color: AppColors.primaryDark,
                      fontSize: adjustValue(context, 36.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: MainCard(
                        context: context,
                        onTap: () {
                          Navigator.push(
                            context,
                            InOutPageRoute(
                              UnitsScreen(subject: subjects[0]),
                              Alignment.bottomCenter,
                            ),
                          );
                        },
                        image: Image.asset(
                          Assets.arabicSymbolImg,
                          width: adjustWidthValue(context, 180.0),
                          height: adjustHeightValue(context, 180.0),
                        ),
                        text: 'لغة عربية',
                      ),
                    ),
                    SizedBox(
                      width: adjustValue(context, 15.0),
                    ),
                    Expanded(
                      child: MainCard(
                        context: context,
                        onTap: () {
                          print('2');
                          print(progresses);
                          print(subjects);
                          Navigator.push(
                            context,
                            InOutPageRoute(UnitsScreen(subject: subjects[1]),
                                Alignment.bottomCenter),
                          );
                        },
                        image: SvgPicture.asset(Assets.mathSymbol),
                        text: 'حساب',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: adjustValue(context, 15.0),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: MainCard(
                        context: context,
                        onTap: () {
                          Navigator.push(
                            context,
                            InOutPageRoute(
                              UnitsScreen(subject: subjects[2]),
                              Alignment.bottomCenter,
                            ),
                          );
                        },
                        image: SvgPicture.asset(Assets.englishSymbol),
                        text: 'English',
                      ),
                    ),
                    SizedBox(
                      width: adjustValue(context, 15.0),
                    ),
                    Expanded(
                      child: MainCard(
                        context: context,
                        onTap: () {
                          Navigator.push(
                            context,
                            InOutPageRoute(
                              UnitsScreen(subject: subjects[3]),
                              Alignment.bottomCenter,
                            ),
                          );
                        },
                        image: SvgPicture.asset(Assets.iqSymbol),
                        text: 'ذكاء',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state is GetSubjectsSuccessfulLoadedState
                    ? Text("Data Is Loaded")
                    : state is GetSubjectsFailedLoadedState
                        ? Text("Failed .....")
                        : Text("Loading ....."),
              ),
              MainButton(
                context: context,
                text: "text",
                onTap: () {
                  cubit.getSubjectsData();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
