import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/components/reports/divider.dart';
import 'package:najme/components/reports/report_card.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/utility.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Color> gradientColors = [AppColors.secondary, AppColors.secondaryLight];

  List<int> num = [100, 1];

  bool showAvg = false;

  final iconList = <IconData>[
    Icons.wysiwyg_sharp,
    Icons.table_rows_sharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.screenBackground),
                  fit: BoxFit.cover),
            ),
          ),
          Scaffold(
            backgroundColor: AppColors.primaryDark.withOpacity(0.0),
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
                              border: Border.all(
                                  color: AppColors.secondary, width: 3),
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
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 1.70,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18),
                                  ),
                                  color: AppColors.primaryLight),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0,
                                    left: 8.0,
                                    top: 24,
                                    bottom: 12),
                                child: LineChart(
                                  showAvg ? avgData() : mainData(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 34,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  showAvg = !showAvg;
                                });
                              },
                              child: Text(
                                'avg',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w900,
                                    color: showAvg
                                        ? Colors.white.withOpacity(0.6)
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 73,
                              child: Text(
                                'المستوي',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w900,
                                    color: showAvg
                                        ? Colors.white.withOpacity(0.6)
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    DividerLine(),
                    ReportCard(
                      context: context,
                      key: null,
                      titleText: 'الدروس المنتهية',
                      numText1: 30,
                      numText2: 60,
                      //percentageText: 0.3,
                      up: false,
                      downText: '10%',

                    ),
                    // DividerLine(),
                    // ReportCard(
                    //   context: context,
                    //   key: null,
                    //   titleText: 'حل الدرس من المرة الأولي',
                    //   numText: '65/100',
                    //   percentageText: '65%',
                    //   up: false,
                    //   downText: '23%',
                    // ),
                    // DividerLine(),
                    // ReportCard(
                    //   context: context,
                    //   key: null,
                    //   titleText: 'الدروس المنتهية',
                    //   numText: '30/60',
                    //   percentageText: '50%',
                    //   up: true,
                    //   upText: '10%',
                    // ),
                    // DividerLine(),
                    // ReportCard(
                    //   context: context,
                    //   key: null,
                    //   titleText: 'حل الدرس من المرة الأولي',
                    //   numText: '65/100',
                    //   percentageText: '65%',
                    //   up: false,
                    //   downText: '23%',
                    // ),
                  ]),
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
                  onPressed: () {},
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              elevation: 0,
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
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipRoundedRadius: 10,
            maxContentWidth: 50,
            tooltipBgColor: AppColors.primary,
            showOnTopOfTheChartBoxArea: false),
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            fontFamily: 'Cairo',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '2020';
              case 3:
                return '2021';
              case 5:
                return '2022';
              case 7:
                return '2023';
              case 9:
                return '2024';
              case 11:
                return 'السنة';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            fontFamily: 'Cairo',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '30';
              case 5:
                return '50';
            }
            return '';
          },
          reservedSize: 22,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(width: 5.0, color: AppColors.white),
            bottom: BorderSide(width: 5.0, color: AppColors.white),
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,

          colors: [AppColors.secondary],
          //gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,

            // getDotPainter: FlDotPainter(
            //
            // )
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: false,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            fontFamily: 'Cairo',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '2020';
              case 3:
                return '2021';
              case 5:
                return '2022';
              case 7:
                return '2023';
              case 9:
                return '2024';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w900,
            fontSize: 16,
            fontFamily: 'Cairo',
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '30';
              case 5:
                return '50';
            }
            return '';
          },
          reservedSize: 22,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            // top: BorderSide(width: 2.0, color: Color(0xFFFFFFFF)),
            left: BorderSide(width: 5.0, color: AppColors.white),
            // right: BorderSide(width: 2.0, color: Color(0xFF000000)),
            bottom: BorderSide(width: 5.0, color: AppColors.white),
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.5)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.8)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)!
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
