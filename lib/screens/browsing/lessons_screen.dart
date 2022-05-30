import 'package:flutter/material.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/components/general/app_bar.dart';
import 'package:najme/components/general/drawer.dart';
import 'package:najme/components/screen_specific/space/lesson.dart';
import 'package:najme/components/screen_specific/space/space_main_container.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/question/order_game.dart';
import 'package:najme/utility.dart';
import 'package:najme/data.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({
    Key? key,
    required this.subject,
    required this.unit,
  }) : super(key: key);

  final Subject subject;
  final Unit unit;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: database.getLessons(unit.id),
      initialData: [],
      builder: (context, AsyncSnapshot<List> snapshot) {
        List<Lesson> lessons = snapshot.data!.cast<Lesson>();
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
                              unit.name,
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.center,
                      ),
                      Expanded(
                        child: ListView(
                          children: buildList(
                              context, lessons, progress.currentLesson - 1),
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
    BuildContext context, List<Lesson> lessons, int current) {
  bool row_is_one = false;
  List<Widget> list = [];

  for (int i = 0; i < lessons.length; i++, row_is_one = !row_is_one) {
    list.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LessonIcon(
          context: context,
          title: lessons[i].name,
          onClick: () {
            Navigator.push(
              context,
              InOutPageRoute(const OrderGame(), Alignment.bottomCenter),
            );
          },
          active: i <= current,
        ),
        if (!row_is_one && ++i < lessons.length)
          LessonIcon(
            context: context,
            title: lessons[i].name,
            onClick: () {
              Navigator.push(
                context,
                InOutPageRoute(const OrderGame(), Alignment.bottomCenter),
              );
            },
            active: i <= current,
          ),
      ],
    ));
  }
  return list;
}
