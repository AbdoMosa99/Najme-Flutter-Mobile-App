
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

List<Color> gradientColors = [AppColors.secondary, AppColors.secondaryLight];

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
              return '2025';
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
            case 7:
              return '70';
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
    maxY: 7,
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
