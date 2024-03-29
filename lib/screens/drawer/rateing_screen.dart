import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:najme/data.dart';
import 'package:najme/components/general/back_button.dart';
import 'package:najme/utility.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'قيم التطبيق',
                    style: TextStyle(
                      fontSize: adjustValue(context, 40.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  Text(
                    'رأيك يهمنا!',
                    style: TextStyle(
                      fontSize: adjustValue(context, 25.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: adjustValue(context, 90)),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: RatingBar.builder(
                    glowColor: AppColors.secondaryLight,
                    glowRadius: adjustValue(context, 40),
                    itemSize: adjustWidthValue(context, 50),
                    initialRating: prefs.getDouble('rating')!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(
                        horizontal: adjustValue(context, 4.0)),
                    itemBuilder: (context, _) => SvgPicture.asset(
                      Assets.rateStar,
                    ),
                    onRatingUpdate: (ratingStar) async {
                      await prefs.setDouble('rating', ratingStar);
                    },
                  ),
                ),
              ),
              MaterialButton(
                color: AppColors.primary,
                minWidth: double.infinity,
                height: adjustValue(context, 80),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(adjustValue(context, 15.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: adjustValue(context, 8)),
                      child: Text(
                        'قيمنا علي جوجل بلاي',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.surface,
                          fontSize: adjustValue(context, 20.0),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.googlePlay,
                      height: adjustValue(context, 50.0),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
          PBackButton(context: context),
        ],
      ),
    );
  }
}
