import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/screen_specific/space/unit.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/utility.dart';
import 'package:najme/screens/browsing/lessons_screen.dart';
import 'package:najme/data.dart';

class UnitsScreen extends StatelessWidget {
  const UnitsScreen({
    Key? key,
    required this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.getUnits(subject.id),
      initialData: [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        List<Unit> units = snapshot.data!.cast<Unit>();
        Progress progress = progresses
            .where((element) => element.subjectId == subject.id)
            .first;

        return snapshot.hasData
            ? SpaceContainer(
                appBar: MainAppBar(
                  context: context,
                ),
                drawer: MainDrawer(
                  context: context,
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(adjustValue(context, 30)),
                            bottomRight:
                                Radius.circular(adjustValue(context, 30)),
                          ),
                          color: const Color.fromRGBO(80, 54, 164, 0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 35,
                                  color: AppColors.secondary,
                                ),
                                Text(
                                  '${progress.stars}',
                                  style: TextStyle(
                                    color: AppColors.secondary,
                                    fontSize: adjustValue(context, 25),
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w800,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              subject.category,
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: adjustValue(context, 30),
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 35,
                                color: AppColors.secondary,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                      ),
                      Expanded(
                        child: ListView(
                          children: buildList(context, units,
                              progress.currentUnit - 1, subject),
                          reverse: true,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

List<Widget> buildList(
  BuildContext context,
  List<Unit> units,
  int current,
  Subject subject,
) {
  bool row_is_one = false;
  List<Widget> list = [];
  // print(units);
  // print(current);
  // print(units.length);
  for (int i = 0; i < units.length; i++, row_is_one = !row_is_one) {
    list.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UnitIcon(
            context: context,
            icon: units[i].icon,
            title: units[i].name,
            onClick: () {
              Navigator.push(
                context,
                InOutPageRoute(
                    LessonsScreen(
                      subject: subject,
                      unit: units[i],
                    ),
                    Alignment.bottomCenter),
              );
            },
            active: i <= current,
          ),
          if (!row_is_one && ++i < units.length)
            UnitIcon(
              context: context,
              icon: units[i].icon,
              title: units[i].name,
              onClick: () {
                Navigator.push(
                  context,
                  InOutPageRoute(
                      LessonsScreen(
                        subject: subject,
                        unit: units[i],
                      ),
                      Alignment.bottomCenter),
                );
              },
              active: i <= current,
            ),
        ],
      ),
    );
  }
  return list;
}
