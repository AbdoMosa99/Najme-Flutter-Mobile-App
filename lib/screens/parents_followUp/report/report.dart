import 'package:flutter/material.dart';
import 'package:najme/components/general/screen_background.dart';
import 'package:najme/components/reports/divider.dart';
import 'package:najme/components/reports/graph.dart';
import 'package:najme/components/reports/navigation_bar.dart';
import 'package:najme/components/reports/report_card.dart';
import 'package:najme/components/screen_specific/personal_profile_updates/popUpMenuButton.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/screens/parents_followUp/report/filter_dialog.dart';
import 'package:najme/utility.dart';
import '../../../components/reports/filter_card.dart';
import '../../../components/reports/floating_logo_button.dart';
import '../../../components/reports/line_chart_data.dart';
import '../../../components/reports/parents_follow_up_bar.dart';

class Report extends StatefulWidget {
  Report({Key? key}) : super(key: key);
  List<Color> gradientColors = [AppColors.secondary, AppColors.secondaryLight];

  List<int> num = [100, 1];
  List<String> profiles = ['احمد', 'محمد'];
  bool showAvg = false;

  int filterLevel = 0;
  int filterSemester = 0;
  int filterSubject = 0;
  int filterDate = 0;
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> with SingleTickerProviderStateMixin {
  final iconList = <IconData>[Icons.assignment, Icons.filter_list];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          ScreenBackground(bgImage: Assets.screenBackground),
          Scaffold(
            backgroundColor: AppColors.primaryDark.withOpacity(0.0),
            appBar:
                ParentsFollowUpBar(context: context, profiles: widget.profiles),
            body: Column(
              children: [
                Container(
                  height: adjustHeightValue(context, 50.0),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilterCard(
                        context: context,
                        titleText:
                            'المرحلة: ${FilterLevelList[widget.filterLevel]}',
                      ),
                      FilterCard(
                        context: context,
                        titleText:
                            'الترم: ${FilterSemList[widget.filterSemester]}',
                      ),
                      FilterCard(
                        context: context,
                        titleText:
                            'المادة: ${FilterSubjectList[widget.filterSubject]}',
                      ),
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
                    child: ListView(children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: adjustValue(context, 10.0)),
                        child: Graph(
                            context: context,
                            data: widget.showAvg ? avgData() : mainData(),
                            XTitle: 'السنة',
                            YTitle: 'المستوى'),
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
                onPressed: () {
                  print('object');
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: PNavigationBar(
              context: context,
              iconList: iconList,
              onTap: (index) {
                if (index == 0) {
                } else {
                  return FilterDialog1(
                      context: context,
                      popUp: PopUpMenu(
                        context: context,
                        list: FilterLevelList,
                        initialIndex: widget.filterLevel,
                        callBack: (value) {
                          setState(() {
                            widget.filterLevel = value;
                          });
                        },
                      ),
                      titel: 'المرحلة:',
                      numberDialog: '1/4',
                      FABFunction: () {
                        FilterDialog2(
                            context: context,
                            popUp: PopUpMenu(
                              context: context,
                              list: FilterSemList,
                              initialIndex: widget.filterSemester,
                              callBack: (value) {
                                setState(() {
                                  widget.filterSemester = value;
                                });
                              },
                            ),
                            titel: 'الترم:',
                            numberDialog: '2/4',
                            FABFunction: () {
                              FilterDialog3(
                                  context: context,
                                  popUp: PopUpMenu(
                                    context: context,
                                    list: FilterSubjectList,
                                    initialIndex: widget.filterSubject,
                                    callBack: (value) {
                                      setState(() {
                                        widget.filterSubject = value;
                                      });
                                    },
                                  ),
                                  titel: 'المادة:',
                                  numberDialog: '3/4',
                                  FABFunction: () {
                                    FilterDialog4(
                                        context: context,
                                        popUp: Row(
                                          children: [
                                            Expanded(
                                              child: PopUpMenu(
                                                context: context,
                                                list: yearsList,
                                                initialIndex: widget.filterDate,
                                                callBack: (value) {
                                                  setState(() {
                                                    widget.filterDate = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Expanded(
                                              child: PopUpMenu(
                                                context: context,
                                                list: monthsList,
                                                initialIndex: widget.filterDate,
                                                callBack: (value) {
                                                  setState(() {
                                                    widget.filterDate = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        titel: 'التاريخ:',
                                        numberDialog: '4/4',
                                        search: true,
                                        FABFunction: () {
                                          Navigator.pop(context, FilterDialog3);
                                          Navigator.pop(context, FilterDialog2);
                                          Navigator.pop(context, FilterDialog1);
                                          Navigator.pop(context, null);
                                        });
                                  });
                            });
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}