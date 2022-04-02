

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utility.dart';

Widget Graph ({
  required BuildContext context,
  required LineChartData data,
  required String XTitle,
  required String YTitle,
})
{
  return AspectRatio(
            aspectRatio: 1.70,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      color: AppColors.primaryLight),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0,
                        left: 8.0,
                        top: 24,
                        bottom: 12),
                    child: LineChart(
                      data,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    right: adjustValue(context, 9.0),
                    top: adjustValue(context, 6.0),


                  ),
                  child: Text(
                      '${XTitle} / ${YTitle}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: adjustValue(context, 15),
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w900,
                          color: Colors.white
                      ),
                    ),
                ),
              ],
            ),
          );
}