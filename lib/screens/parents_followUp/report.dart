import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/general/screen_background.dart';
import 'package:najme/components/reports/divider.dart';
import 'package:najme/components/reports/graph.dart';
import 'package:najme/components/reports/navigation_bar.dart';
import 'package:najme/components/reports/report_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

import '../../components/reports/filter_card.dart';
import '../../components/reports/floating_logo_button.dart';
import '../../components/reports/line_chart_data.dart';
import '../../components/reports/parents_follow_up_bar.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Color> gradientColors = [AppColors.secondary, AppColors.secondaryLight];

  List<int> num = [100, 1];
  List<String> profiles = ['احمد','محمد'];
  bool showAvg = false;

  final iconList = <IconData>[
    Icons.assignment,
    Icons.filter_list
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          ScreenBackground(
            bgImage: Assets.screenBackground
          ),
          Scaffold(
            backgroundColor: AppColors.primaryDark.withOpacity(0.0),
            appBar: ParentsFollowUpBar(context: context, profiles: profiles),
            body: Column(
              children: [
                Container(
                height: adjustHeightValue(context, 50.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilterCard(context: context, titleText: 'المرحلة: KG1',),
                      FilterCard(context: context, titleText: 'الترم: الأول',),
                      FilterCard(context: context, titleText: 'المادة: حساب',),

                    ],
                  ),
                ),

                Expanded(
                  //physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: adjustValue(context, 18.0),
                      right: adjustValue(context, 18.0),
                    ),
                    child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: adjustValue(context, 10.0)),
                            child: Graph(
                                      context: context,
                                      data: showAvg ? avgData() : mainData(),
                                      XTitle: 'السنة',
                                      YTitle: 'المستوى'
                                    ),
                          ),
                          DividerLine(),
                          ReportCard(
                            context: context,
                            titleText: 'الدروس المنتهية',
                            numText1: 30,
                            numText2: 60,
                            up: true,
                            upOrDownText: 10,
                          ),
                          DividerLine(),
                          ReportCard(
                            context: context,
                            titleText: 'الدروس المنتهية',
                            numText1: 30,
                            numText2: 60,
                            up: true,
                            upOrDownText: 10,
                          ),
                          SizedBox(
                            height: adjustHeightValue(context, 40.0),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingLogoButton(
              context: context,
              onPressed: (){}
            ),

            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: PNavigationBar(
                context: context,
                iconList: iconList,
                onTap: (index) {
                  print(index);
                },
              ),
          ),
        ],
      ),
    );
  }
}
