import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:najme/constants/colors.dart';
import '../../utility.dart';
import 'dart:math' as math;

class ReportCard extends Container {
  ReportCard({
    Key? key,
    required BuildContext context,
    required String titleText,
    int? numText1,
    int? numText2,
    bool up = true,
    var upText,
    downText,
  }) : super(
          key: key,
          child: Container(
            width: adjustWidthValue(context, 320),
            height: adjustHeightValue(context, 85.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(adjustValue(context, 20.0)),
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    LiquidCustomProgressIndicator(
                      value: numText1!/numText2!,
                      valueColor: AlwaysStoppedAnimation(AppColors.secondary),
                      backgroundColor: AppColors.background,
                      direction: Axis.vertical,
                      shapePath: StarClipper(5).getClip(
                        Size.fromWidth(100),
                      ), // A Path object used to draw the shape of the progress indicator. The size of the progress indicator is created from the bounds of this path.
                    ),
                    Text(
                      '${(numText1/numText2 * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: adjustValue(context, 25.0),
                        fontFamily: 'Cairo',
                        color: AppColors.primaryDark,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleText,
                        style: TextStyle(
                            fontSize: adjustValue(context, 20.0),
                            fontFamily: 'Cairo',
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${numText1}/${numText2}',
                            style: TextStyle(
                                fontSize: adjustValue(context, 20.0),
                                fontFamily: 'Cairo',
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            up
                                ? Icons.arrow_drop_up_outlined
                                : Icons.arrow_drop_down_outlined,
                            color: up ? Colors.green : Colors.red,
                            size: 40,
                          ),
                          Text(
                            up ? upText : downText,
                            style: TextStyle(
                                fontSize: adjustValue(context, 20.0),
                                fontFamily: 'Cairo',
                                color: up ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}

class StarClipper extends CustomClipper<Path> {
  /// The number of points of the star
  final int points;

  StarClipper(this.points);

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

    path.moveTo(halfWidth, 0);

    for (double step = 0; step < max; step += degreesPerStep) {
      path.lineTo(halfWidth - wingRadius * math.sin(step),
          halfWidth - wingRadius * math.cos(step));
      path.lineTo(halfWidth - radius * math.sin(step + halfDegreesPerStep),
          halfWidth - radius * math.cos(step + halfDegreesPerStep));
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
