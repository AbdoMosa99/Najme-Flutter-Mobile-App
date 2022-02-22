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
import 'dart:math' as math;

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<Color> gradientColors = [AppColors.secondary, AppColors.secondaryLight];

  List<int> num = [100,1];

  bool showAvg = false;
  double value = .65;

  final iconList = <IconData>[
    Icons.wysiwyg_sharp,
    Icons.table_rows_sharp,
  ];

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
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
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.screenBackground), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
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
                                  right: 20.0, left: 8.0, top: 24, bottom: 12),
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
                    DividerLine(),
                    ReportCard(
                      context: context,
                      key: null,
                      titleText: 'الدروس المنتهية',
                      numText: '30/60',
                      percentageText: '50%',
                      up: true,
                      upText: '10%',
                    ),
                    DividerLine(),
                    ReportCard(
                      context: context,
                      key: null,
                      titleText: 'حل الدرس من المرة الأولي',
                      numText: '65/100',
                      percentageText: '65%',
                      up: false,
                      downText: '23%',
                    ),
                    DividerLine(),
                    ReportCard(
                      context: context,
                      key: null,
                      titleText: 'الدروس المنتهية',
                      numText: '30/60',
                      percentageText: '50%',
                      up: true,
                      upText: '10%',
                    ),
                    DividerLine(),
                    ReportCard(
                      context: context,
                      key: null,
                      titleText: 'حل الدرس من المرة الأولي',
                      numText: '65/100',
                      percentageText: '65%',
                      up: false,
                      downText: '23%',
                    ),

                  ]),
            ),
          ),
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

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
              tooltipRoundedRadius: 10,
              maxContentWidth: 50,
              tooltipBgColor: AppColors.primary,
            showOnTopOfTheChartBoxArea: false
          ),
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
          colors: [AppColors.secondary],//gradientColors,
          barWidth: 8,
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
                gradientColors.map((color) => color.withOpacity(0.5)).toList(),
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


class StarClipper extends CustomClipper<Path> {
  /// The number of points of the star
  final int points;
  StarClipper(this.points);

  // Degrees to radians conversion
  double _degreeToRadian(double deg) => deg * (math.pi / 180.0);

  @override
  Path getClip(Size size) {
    Path path = Path();
    double max = 2 * math.pi;

    double width = size.width;
    double halfWidth = width / 2;

    double wingRadius = halfWidth;
    double radius = halfWidth / 2;

    double degreesPerStep = _degreeToRadian(360 / points);
    double halfDegreesPerStep = degreesPerStep / 2;

    path.moveTo(width, halfWidth);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth + wingRadius * math.cos(step),
          halfWidth + wingRadius * math.sin(step));
      path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep),
          halfWidth + radius * math.sin(step + halfDegreesPerStep));
    }

    path.close();
    return path;
  }

  // If the new instance represents different information than the old instance, this method will return true, otherwise it should return false.
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    StarClipper starClipper = oldClipper as StarClipper;
    return points != starClipper.points;
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xff4C58F4);
    path = Path();
    path.lineTo(size.width, size.height * 0.47);
    path.cubicTo(size.width * 1.04, size.height * 0.43, size.width,
        size.height * 0.35, size.width * 0.95, size.height * 0.34);
    path.cubicTo(size.width * 0.95, size.height * 0.34, size.width * 0.73,
        size.height * 0.31, size.width * 0.73, size.height * 0.31);
    path.cubicTo(size.width * 0.71, size.height * 0.3, size.width * 0.69,
        size.height * 0.29, size.width * 0.68, size.height * 0.27);
    path.cubicTo(size.width * 0.68, size.height * 0.27, size.width * 0.58,
        size.height * 0.06, size.width * 0.58, size.height * 0.06);
    path.cubicTo(size.width * 0.55, 0, size.width * 0.48, 0, size.width * 0.45,
        size.height * 0.06);
    path.cubicTo(size.width * 0.45, size.height * 0.06, size.width * 0.35,
        size.height * 0.27, size.width * 0.35, size.height * 0.27);
    path.cubicTo(size.width * 0.34, size.height * 0.29, size.width * 0.32,
        size.height * 0.3, size.width * 0.3, size.height * 0.31);
    path.cubicTo(size.width * 0.3, size.height * 0.31, size.width * 0.08,
        size.height * 0.34, size.width * 0.08, size.height * 0.34);
    path.cubicTo(size.width * 0.02, size.height * 0.35, -0.01,
        size.height * 0.43, size.width * 0.04, size.height * 0.47);
    path.cubicTo(size.width * 0.04, size.height * 0.47, size.width / 5,
        size.height * 0.63, size.width / 5, size.height * 0.63);
    path.cubicTo(size.width / 5, size.height * 0.65, size.width * 0.22,
        size.height * 0.67, size.width * 0.22, size.height * 0.7);
    path.cubicTo(size.width * 0.22, size.height * 0.7, size.width * 0.18,
        size.height * 0.93, size.width * 0.18, size.height * 0.93);
    path.cubicTo(size.width * 0.17, size.height, size.width * 0.23,
        size.height * 1.04, size.width * 0.28, size.height);
    path.cubicTo(size.width * 0.28, size.height, size.width * 0.48,
        size.height * 0.9, size.width * 0.48, size.height * 0.9);
    path.cubicTo(size.width / 2, size.height * 0.89, size.width * 0.53,
        size.height * 0.89, size.width * 0.55, size.height * 0.9);
    path.cubicTo(size.width * 0.55, size.height * 0.9, size.width * 0.75,
        size.height, size.width * 0.75, size.height);
    path.cubicTo(size.width * 0.8, size.height * 1.04, size.width * 0.86,
        size.height, size.width * 0.85, size.height * 0.93);
    path.cubicTo(size.width * 0.85, size.height * 0.93, size.width * 0.81,
        size.height * 0.7, size.width * 0.81, size.height * 0.7);
    path.cubicTo(size.width * 0.81, size.height * 0.67, size.width * 0.82,
        size.height * 0.65, size.width * 0.83, size.height * 0.63);
    path.cubicTo(size.width * 0.83, size.height * 0.63, size.width,
        size.height * 0.47, size.width, size.height * 0.47);
    path.lineTo(size.width, size.height * 0.47);
    canvas.drawPath(path, paint);

    // Path number 2

    paint.color = Color(0xff4C58F4);
    path = Path();
    path.lineTo(size.width * 0.26, size.height * 0.95);
    path.cubicTo(size.width * 0.26, size.height * 0.95, size.width * 0.3,
        size.height * 0.72, size.width * 0.3, size.height * 0.72);
    path.cubicTo(size.width * 0.3, size.height * 0.69, size.width * 0.3,
        size.height * 0.67, size.width * 0.28, size.height * 0.65);
    path.cubicTo(size.width * 0.28, size.height * 0.65, size.width * 0.12,
        size.height * 0.49, size.width * 0.12, size.height * 0.49);
    path.cubicTo(size.width * 0.08, size.height * 0.45, size.width * 0.1,
        size.height * 0.37, size.width * 0.16, size.height * 0.36);
    path.cubicTo(size.width * 0.16, size.height * 0.36, size.width * 0.38,
        size.height / 3, size.width * 0.38, size.height / 3);
    path.cubicTo(size.width * 0.4, size.height / 3, size.width * 0.42,
        size.height * 0.31, size.width * 0.43, size.height * 0.29);
    path.cubicTo(size.width * 0.43, size.height * 0.29, size.width * 0.53,
        size.height * 0.08, size.width * 0.53, size.height * 0.08);
    path.cubicTo(size.width * 0.54, size.height * 0.06, size.width * 0.55,
        size.height * 0.05, size.width * 0.57, size.height * 0.04);
    path.cubicTo(size.width * 0.54, 0, size.width * 0.48, size.height * 0.01,
        size.width * 0.45, size.height * 0.06);
    path.cubicTo(size.width * 0.45, size.height * 0.06, size.width * 0.35,
        size.height * 0.27, size.width * 0.35, size.height * 0.27);
    path.cubicTo(size.width * 0.34, size.height * 0.29, size.width * 0.32,
        size.height * 0.3, size.width * 0.3, size.height * 0.31);
    path.cubicTo(size.width * 0.3, size.height * 0.31, size.width * 0.08,
        size.height * 0.34, size.width * 0.08, size.height * 0.34);
    path.cubicTo(size.width * 0.02, size.height * 0.35, -0.01,
        size.height * 0.43, size.width * 0.04, size.height * 0.47);
    path.cubicTo(size.width * 0.04, size.height * 0.47, size.width / 5,
        size.height * 0.63, size.width / 5, size.height * 0.63);
    path.cubicTo(size.width / 5, size.height * 0.65, size.width * 0.22,
        size.height * 0.67, size.width * 0.22, size.height * 0.7);
    path.cubicTo(size.width * 0.22, size.height * 0.7, size.width * 0.18,
        size.height * 0.93, size.width * 0.18, size.height * 0.93);
    path.cubicTo(size.width * 0.17, size.height, size.width * 0.23,
        size.height * 1.03, size.width * 0.28, size.height);
    path.cubicTo(size.width * 0.26, size.height, size.width * 0.26,
        size.height * 0.97, size.width * 0.26, size.height * 0.95);
    path.cubicTo(size.width * 0.26, size.height * 0.95, size.width * 0.26,
        size.height * 0.95, size.width * 0.26, size.height * 0.95);
    path.lineTo(size.width * 0.26, size.height * 0.95);
    canvas.drawPath(path, paint);

    // Path number 3

    paint.color = Color(0xff000000);
    path = Path();
    path.lineTo(size.width * 0.32, size.height * 0.47);
    path.cubicTo(size.width * 0.32, size.height * 0.47, size.width * 0.32,
        size.height / 2, size.width * 0.32, size.height / 2);
    path.cubicTo(size.width * 0.32, size.height * 0.51, size.width / 3,
        size.height * 0.52, size.width * 0.34, size.height * 0.52);
    path.cubicTo(size.width * 0.34, size.height * 0.52, size.width * 0.35,
        size.height * 0.51, size.width * 0.35, size.height / 2);
    path.cubicTo(size.width * 0.35, size.height / 2, size.width * 0.35,
        size.height * 0.47, size.width * 0.35, size.height * 0.47);
    path.cubicTo(size.width * 0.35, size.height * 0.46, size.width * 0.34,
        size.height * 0.45, size.width * 0.34, size.height * 0.45);
    path.cubicTo(size.width / 3, size.height * 0.45, size.width * 0.32,
        size.height * 0.46, size.width * 0.32, size.height * 0.47);
    path.cubicTo(size.width * 0.32, size.height * 0.47, size.width * 0.32,
        size.height * 0.47, size.width * 0.32, size.height * 0.47);
    path.lineTo(size.width * 0.32, size.height * 0.47);
    canvas.drawPath(path, paint);

    // Path number 4

    paint.color = Color(0xff000000);
    path = Path();
    path.lineTo(size.width * 0.71, size.height / 2);
    path.cubicTo(size.width * 0.71, size.height / 2, size.width * 0.71,
        size.height * 0.47, size.width * 0.71, size.height * 0.47);
    path.cubicTo(size.width * 0.71, size.height * 0.46, size.width * 0.7,
        size.height * 0.45, size.width * 0.69, size.height * 0.45);
    path.cubicTo(size.width * 0.69, size.height * 0.45, size.width * 0.68,
        size.height * 0.46, size.width * 0.68, size.height * 0.47);
    path.cubicTo(size.width * 0.68, size.height * 0.47, size.width * 0.68,
        size.height / 2, size.width * 0.68, size.height / 2);
    path.cubicTo(size.width * 0.68, size.height * 0.51, size.width * 0.69,
        size.height * 0.52, size.width * 0.69, size.height * 0.52);
    path.cubicTo(size.width * 0.7, size.height * 0.52, size.width * 0.71,
        size.height * 0.51, size.width * 0.71, size.height / 2);
    path.cubicTo(size.width * 0.71, size.height / 2, size.width * 0.71,
        size.height / 2, size.width * 0.71, size.height / 2);
    path.lineTo(size.width * 0.71, size.height / 2);
    canvas.drawPath(path, paint);

    // Path number 5

    paint.color = Color(0xff000000);
    path = Path();
    path.lineTo(size.width * 0.52, size.height * 0.53);
    path.cubicTo(size.width * 0.54, size.height * 0.53, size.width * 0.56,
        size.height * 0.52, size.width * 0.57, size.height * 0.51);
    path.cubicTo(size.width * 0.58, size.height / 2, size.width * 0.58,
        size.height * 0.49, size.width * 0.57, size.height * 0.49);
    path.cubicTo(size.width * 0.56, size.height * 0.48, size.width * 0.55,
        size.height * 0.48, size.width * 0.55, size.height * 0.49);
    path.cubicTo(size.width * 0.54, size.height / 2, size.width * 0.53,
        size.height / 2, size.width * 0.52, size.height / 2);
    path.cubicTo(size.width / 2, size.height / 2, size.width * 0.49,
        size.height / 2, size.width * 0.48, size.height * 0.49);
    path.cubicTo(size.width * 0.48, size.height * 0.48, size.width * 0.47,
        size.height * 0.48, size.width * 0.46, size.height * 0.49);
    path.cubicTo(size.width * 0.45, size.height * 0.49, size.width * 0.45,
        size.height / 2, size.width * 0.46, size.height * 0.51);
    path.cubicTo(size.width * 0.47, size.height * 0.52, size.width * 0.49,
        size.height * 0.53, size.width * 0.52, size.height * 0.53);
    path.cubicTo(size.width * 0.52, size.height * 0.53, size.width * 0.52,
        size.height * 0.53, size.width * 0.52, size.height * 0.53);
    path.lineTo(size.width * 0.52, size.height * 0.53);
    canvas.drawPath(path, paint);

    // Path number 6

    paint.color = Color(0xff000000);
    path = Path();
    path.lineTo(size.width / 5, size.height * 0.69);
    path.cubicTo(size.width / 5, size.height * 0.69, size.width * 0.17,
        size.height * 0.93, size.width * 0.17, size.height * 0.93);
    path.cubicTo(size.width * 0.16, size.height * 0.96, size.width * 0.17,
        size.height, size.width / 5, size.height);
    path.cubicTo(size.width * 0.23, size.height * 1.03, size.width * 0.26,
        size.height * 1.04, size.width * 0.29, size.height * 1.02);
    path.cubicTo(size.width * 0.29, size.height * 1.02, size.width * 0.49,
        size.height * 0.91, size.width * 0.49, size.height * 0.91);
    path.cubicTo(size.width * 0.51, size.height * 0.9, size.width * 0.52,
        size.height * 0.9, size.width * 0.54, size.height * 0.91);
    path.cubicTo(size.width * 0.54, size.height * 0.91, size.width * 0.74,
        size.height * 1.02, size.width * 0.74, size.height * 1.02);
    path.cubicTo(size.width * 0.77, size.height * 1.04, size.width * 0.8,
        size.height * 1.03, size.width * 0.83, size.height);
    path.cubicTo(size.width * 0.86, size.height, size.width * 0.87,
        size.height * 0.96, size.width * 0.86, size.height * 0.93);
    path.cubicTo(size.width * 0.86, size.height * 0.93, size.width * 0.85,
        size.height * 0.82, size.width * 0.85, size.height * 0.82);
    path.cubicTo(size.width * 0.85, size.height * 0.81, size.width * 0.84,
        size.height * 0.81, size.width * 0.83, size.height * 0.81);
    path.cubicTo(size.width * 0.82, size.height * 0.81, size.width * 0.82,
        size.height * 0.82, size.width * 0.82, size.height * 0.83);
    path.cubicTo(size.width * 0.82, size.height * 0.83, size.width * 0.83,
        size.height * 0.93, size.width * 0.83, size.height * 0.93);
    path.cubicTo(size.width * 0.84, size.height * 0.95, size.width * 0.83,
        size.height * 0.98, size.width * 0.81, size.height);
    path.cubicTo(size.width * 0.8, size.height, size.width * 0.77, size.height,
        size.width * 0.76, size.height);
    path.cubicTo(size.width * 0.76, size.height, size.width * 0.55,
        size.height * 0.88, size.width * 0.55, size.height * 0.88);
    path.cubicTo(size.width * 0.53, size.height * 0.87, size.width / 2,
        size.height * 0.87, size.width * 0.48, size.height * 0.88);
    path.cubicTo(size.width * 0.48, size.height * 0.88, size.width * 0.28,
        size.height, size.width * 0.28, size.height);
    path.cubicTo(size.width * 0.26, size.height, size.width * 0.23, size.height,
        size.width * 0.22, size.height);
    path.cubicTo(size.width / 5, size.height * 0.98, size.width * 0.19,
        size.height * 0.95, size.width / 5, size.height * 0.93);
    path.cubicTo(size.width / 5, size.height * 0.93, size.width * 0.23,
        size.height * 0.7, size.width * 0.23, size.height * 0.7);
    path.cubicTo(size.width * 0.24, size.height * 0.67, size.width * 0.23,
        size.height * 0.64, size.width / 5, size.height * 0.62);
    path.cubicTo(size.width / 5, size.height * 0.62, size.width * 0.05,
        size.height * 0.46, size.width * 0.05, size.height * 0.46);
    path.cubicTo(size.width * 0.03, size.height * 0.44, size.width * 0.03,
        size.height * 0.42, size.width * 0.03, size.height * 0.4);
    path.cubicTo(size.width * 0.04, size.height * 0.38, size.width * 0.06,
        size.height * 0.36, size.width * 0.08, size.height * 0.36);
    path.cubicTo(size.width * 0.08, size.height * 0.36, size.width * 0.3,
        size.height * 0.32, size.width * 0.3, size.height * 0.32);
    path.cubicTo(size.width / 3, size.height * 0.32, size.width * 0.35,
        size.height * 0.3, size.width * 0.37, size.height * 0.28);
    path.cubicTo(size.width * 0.37, size.height * 0.28, size.width * 0.41,
        size.height * 0.18, size.width * 0.41, size.height * 0.18);
    path.cubicTo(size.width * 0.42, size.height * 0.17, size.width * 0.41,
        size.height * 0.16, size.width * 0.41, size.height * 0.16);
    path.cubicTo(size.width * 0.4, size.height * 0.15, size.width * 0.39,
        size.height * 0.16, size.width * 0.38, size.height * 0.16);
    path.cubicTo(size.width * 0.38, size.height * 0.16, size.width * 0.34,
        size.height * 0.26, size.width * 0.34, size.height * 0.26);
    path.cubicTo(size.width / 3, size.height * 0.28, size.width * 0.31,
        size.height * 0.29, size.width * 0.3, size.height * 0.29);
    path.cubicTo(size.width * 0.3, size.height * 0.29, size.width * 0.07,
        size.height / 3, size.width * 0.07, size.height / 3);
    path.cubicTo(size.width * 0.04, size.height / 3, size.width * 0.01,
        size.height * 0.35, 0, size.height * 0.39);
    path.cubicTo(-0.01, size.height * 0.42, 0, size.height * 0.45,
        size.width * 0.03, size.height * 0.48);
    path.cubicTo(size.width * 0.03, size.height * 0.48, size.width * 0.19,
        size.height * 0.64, size.width * 0.19, size.height * 0.64);
    path.cubicTo(size.width / 5, size.height * 0.66, size.width / 5,
        size.height * 0.68, size.width / 5, size.height * 0.69);
    path.cubicTo(size.width / 5, size.height * 0.69, size.width / 5,
        size.height * 0.69, size.width / 5, size.height * 0.69);
    path.lineTo(size.width / 5, size.height * 0.69);
    canvas.drawPath(path, paint);

    // Path number 7

    paint.color = Color(0xff000000);
    path = Path();
    path.lineTo(size.width * 0.96, size.height / 3);
    path.cubicTo(size.width * 0.96, size.height / 3, size.width * 0.73,
        size.height * 0.29, size.width * 0.73, size.height * 0.29);
    path.cubicTo(size.width * 0.72, size.height * 0.29, size.width * 0.7,
        size.height * 0.28, size.width * 0.69, size.height * 0.26);
    path.cubicTo(size.width * 0.69, size.height * 0.26, size.width * 0.59,
        size.height * 0.05, size.width * 0.59, size.height * 0.05);
    path.cubicTo(size.width * 0.58, size.height * 0.02, size.width * 0.55, 0,
        size.width * 0.52, 0);
    path.cubicTo(size.width * 0.48, 0, size.width * 0.45, size.height * 0.02,
        size.width * 0.44, size.height * 0.05);
    path.cubicTo(size.width * 0.44, size.height * 0.05, size.width * 0.41,
        size.height * 0.1, size.width * 0.41, size.height * 0.1);
    path.cubicTo(size.width * 0.41, size.height * 0.11, size.width * 0.41,
        size.height * 0.12, size.width * 0.42, size.height * 0.12);
    path.cubicTo(size.width * 0.43, size.height * 0.13, size.width * 0.44,
        size.height * 0.13, size.width * 0.44, size.height * 0.12);
    path.cubicTo(size.width * 0.44, size.height * 0.12, size.width * 0.47,
        size.height * 0.06, size.width * 0.47, size.height * 0.06);
    path.cubicTo(size.width * 0.48, size.height * 0.04, size.width * 0.49,
        size.height * 0.03, size.width * 0.52, size.height * 0.03);
    path.cubicTo(size.width * 0.54, size.height * 0.03, size.width * 0.56,
        size.height * 0.04, size.width * 0.56, size.height * 0.06);
    path.cubicTo(size.width * 0.56, size.height * 0.06, size.width * 0.66,
        size.height * 0.28, size.width * 0.66, size.height * 0.28);
    path.cubicTo(size.width * 0.68, size.height * 0.3, size.width * 0.7,
        size.height * 0.32, size.width * 0.73, size.height * 0.32);
    path.cubicTo(size.width * 0.73, size.height * 0.32, size.width * 0.95,
        size.height * 0.36, size.width * 0.95, size.height * 0.36);
    path.cubicTo(size.width * 0.97, size.height * 0.36, size.width,
        size.height * 0.38, size.width, size.height * 0.4);
    path.cubicTo(size.width, size.height * 0.42, size.width, size.height * 0.44,
        size.width * 0.98, size.height * 0.46);
    path.cubicTo(size.width * 0.98, size.height * 0.46, size.width * 0.82,
        size.height * 0.62, size.width * 0.82, size.height * 0.62);
    path.cubicTo(size.width * 0.8, size.height * 0.64, size.width * 0.79,
        size.height * 0.67, size.width * 0.8, size.height * 0.7);
    path.cubicTo(size.width * 0.8, size.height * 0.7, size.width * 0.8,
        size.height * 0.75, size.width * 0.8, size.height * 0.75);
    path.cubicTo(size.width * 0.81, size.height * 0.76, size.width * 0.81,
        size.height * 0.76, size.width * 0.82, size.height * 0.76);
    path.cubicTo(size.width * 0.83, size.height * 0.76, size.width * 0.84,
        size.height * 0.75, size.width * 0.83, size.height * 0.74);
    path.cubicTo(size.width * 0.83, size.height * 0.74, size.width * 0.83,
        size.height * 0.69, size.width * 0.83, size.height * 0.69);
    path.cubicTo(size.width * 0.82, size.height * 0.68, size.width * 0.83,
        size.height * 0.66, size.width * 0.84, size.height * 0.64);
    path.cubicTo(size.width * 0.84, size.height * 0.64, size.width,
        size.height * 0.48, size.width, size.height * 0.48);
    path.cubicTo(size.width * 1.03, size.height * 0.45, size.width * 1.04,
        size.height * 0.42, size.width * 1.03, size.height * 0.39);
    path.cubicTo(size.width * 1.02, size.height * 0.35, size.width,
        size.height / 3, size.width * 0.96, size.height / 3);
    path.cubicTo(size.width * 0.96, size.height / 3, size.width * 0.96,
        size.height / 3, size.width * 0.96, size.height / 3);
    path.lineTo(size.width * 0.96, size.height / 3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2238217, size.height * 0.9611363);
    path_0.cubicTo(
        size.width * 0.2128656,
        size.height * 0.9611363,
        size.width * 0.2019858,
        size.height * 0.9577116,
        size.width * 0.1927006,
        size.height * 0.9509846);
    path_0.cubicTo(
        size.width * 0.1754043,
        size.height * 0.9384250,
        size.width * 0.1673245,
        size.height * 0.9168374,
        size.width * 0.1720320,
        size.height * 0.8960066);
    path_0.lineTo(size.width * 0.2363647, size.height * 0.6120734);
    path_0.lineTo(size.width * 0.01818894, size.height * 0.4203691);
    path_0.cubicTo(
        size.width * 0.002151544,
        size.height * 0.4063417,
        size.width * -0.003975016,
        size.height * 0.3841273,
        size.width * 0.002609321,
        size.height * 0.3638011);
    path_0.cubicTo(
        size.width * 0.009193656,
        size.height * 0.3435130,
        size.width * 0.02710793,
        size.height * 0.3291493,
        size.width * 0.04831820,
        size.height * 0.3271847);
    path_0.lineTo(size.width * 0.3369914, size.height * 0.3009265);
    path_0.lineTo(size.width * 0.4511224, size.height * 0.03332161);
    path_0.cubicTo(
        size.width * 0.4595379,
        size.height * 0.01366041,
        size.width * 0.4787034,
        size.height * 0.0009631859,
        size.width * 0.4999976,
        size.height * 0.0009631859);
    path_0.cubicTo(
        size.width * 0.5212918,
        size.height * 0.0009631859,
        size.width * 0.5404573,
        size.height * 0.01366041,
        size.width * 0.5488727,
        size.height * 0.03327575);
    path_0.lineTo(size.width * 0.6630038, size.height * 0.3009265);
    path_0.lineTo(size.width * 0.9516312, size.height * 0.3271847);
    path_0.cubicTo(
        size.width * 0.9728872,
        size.height * 0.3291035,
        size.width * 0.9908015,
        size.height * 0.3435130,
        size.width * 0.9973858,
        size.height * 0.3638011);
    path_0.cubicTo(
        size.width * 1.003970,
        size.height * 0.3840891,
        size.width * 0.9978818,
        size.height * 0.4063417,
        size.width * 0.9818444,
        size.height * 0.4203691);
    path_0.lineTo(size.width * 0.7636686, size.height * 0.6120352);
    path_0.lineTo(size.width * 0.8280013, size.height * 0.8959607);
    path_0.cubicTo(
        size.width * 0.8327164,
        size.height * 0.9168374,
        size.width * 0.8246290,
        size.height * 0.9384250,
        size.width * 0.8073404,
        size.height * 0.9509464);
    path_0.cubicTo(
        size.width * 0.7900899,
        size.height * 0.9634678,
        size.width * 0.7670867,
        size.height * 0.9644310,
        size.width * 0.7489206,
        size.height * 0.9534919);
    path_0.lineTo(size.width * 0.4999976, size.height * 0.8044505);
    path_0.lineTo(size.width * 0.2510746, size.height * 0.9535760);
    path_0.cubicTo(
        size.width * 0.2426591,
        size.height * 0.9585830,
        size.width * 0.2332824,
        size.height * 0.9611363,
        size.width * 0.2238217,
        size.height * 0.9611363);
    path_0.close();
    path_0.moveTo(size.width * 0.4999976, size.height * 0.7402458);
    path_0.cubicTo(
        size.width * 0.5094583,
        size.height * 0.7402458,
        size.width * 0.5188274,
        size.height * 0.7427914,
        size.width * 0.5272505,
        size.height * 0.7477984);
    path_0.lineTo(size.width * 0.7621732, size.height * 0.8885763);
    path_0.lineTo(size.width * 0.7014569, size.height * 0.6205892);
    path_0.cubicTo(
        size.width * 0.6971233,
        size.height * 0.6015166,
        size.width * 0.7035856,
        size.height * 0.5816032,
        size.width * 0.7182954,
        size.height * 0.5686995);
    path_0.lineTo(size.width * 0.9243020, size.height * 0.3876819);
    path_0.lineTo(size.width * 0.6517501, size.height * 0.3628837);
    path_0.cubicTo(
        size.width * 0.6321268,
        size.height * 0.3610873,
        size.width * 0.6152502,
        size.height * 0.3487265,
        size.width * 0.6075824,
        size.height * 0.3306094);
    path_0.lineTo(size.width * 0.4999976, size.height * 0.07807149);
    path_0.lineTo(size.width * 0.3922830, size.height * 0.3306476);
    path_0.cubicTo(
        size.width * 0.3846992,
        size.height * 0.3486424,
        size.width * 0.3678226,
        size.height * 0.3610032,
        size.width * 0.3482450,
        size.height * 0.3627997);
    path_0.lineTo(size.width * 0.07565502, size.height * 0.3875978);
    path_0.lineTo(size.width * 0.2816540, size.height * 0.5686155);
    path_0.cubicTo(
        size.width * 0.2964096,
        size.height * 0.5815573,
        size.width * 0.3028642,
        size.height * 0.6014325,
        size.width * 0.2984925,
        size.height * 0.6205510);
    path_0.lineTo(size.width * 0.2378220, size.height * 0.8885305);
    path_0.lineTo(size.width * 0.4727447, size.height * 0.7477984);
    path_0.cubicTo(
        size.width * 0.4811601,
        size.height * 0.7427914,
        size.width * 0.4905369,
        size.height * 0.7402458,
        size.width * 0.4999976,
        size.height * 0.7402458);
    path_0.close();
    path_0.moveTo(size.width * 0.3347864, size.height * 0.3061017);
    path_0.cubicTo(
        size.width * 0.3347864,
        size.height * 0.3061017,
        size.width * 0.3347864,
        size.height * 0.3061476,
        size.width * 0.3347407,
        size.height * 0.3061858);
    path_0.close();
    path_0.moveTo(size.width * 0.6651248, size.height * 0.3059794);
    path_0.lineTo(size.width * 0.6651706, size.height * 0.3060635);
    path_0.cubicTo(
        size.width * 0.6651706,
        size.height * 0.3060176,
        size.width * 0.6651706,
        size.height * 0.3060176,
        size.width * 0.6651248,
        size.height * 0.3059794);
    path_0.close();
    path_0.moveTo(size.width * 0.6651248, size.height * 0.3059794);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
