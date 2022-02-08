import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/animation/from_in_to_out.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/main/home_screen.dart';
import 'package:najme/utility.dart';


class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  final iconList = <IconData>[
    Icons.wysiwyg_sharp,
    Icons.table_rows_sharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: 110,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_outlined),
              iconSize: adjustValue(context, 30),
              alignment: Alignment.center,
            ),
          ],
          title: Row(
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: adjustWidthValue(context, 70),
                        height: adjustHeightValue(context, 70),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border:
                          Border.all(color: AppColors.secondary, width: 3),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            Assets.male,
                            height: adjustValue(context, 50.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تقارير المستوي',
                    style: TextStyle(
                      fontSize: adjustValue(context, 30.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'الطبيب محمد',
                    style: TextStyle(
                      fontSize: adjustValue(context, 20.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
          //leading:
        ),

        floatingActionButton: Container(
          width: 80,
          height: 80,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: AppColors.primaryLight,
              child: Image(
                height: adjustHeightValue(context, 40),
                image: AssetImage(Assets.logo),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  InOutPageRoute(const HomeScreen(), Alignment.bottomCenter),
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: AppColors.primary,
          activeColor: AppColors.secondary,
          inactiveColor: AppColors.secondary,
          iconSize: adjustValue(context, 40),
          icons: iconList,
          activeIndex: 0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: adjustValue(context, 60),
          rightCornerRadius: adjustValue(context, 60),
          onTap: (index) {},
          //onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }
}




