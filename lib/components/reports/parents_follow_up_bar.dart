import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/data.dart';
import 'package:najme/utility.dart';

class ParentsFollowUpBar extends AppBar {
  ParentsFollowUpBar(
      {Key? key, required BuildContext context, required List<String> profiles})
      : super(
          key: key,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          toolbarHeight: 100,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_forward_ios_outlined),
              iconSize: adjustValue(context, 30),
              alignment: Alignment.center,
            ),
          ],
          title: Row(
            children: [
              PopupMenuButton<String>(
                shape: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(adjustValue(context, 18)),
                    borderSide: BorderSide(
                        color: AppColors.secondaryLight,
                        width: adjustWidthValue(context, 1))),
                color: AppColors.surface,
                itemBuilder: (context) {
                  return profiles
                      .map((str) => PopupMenuItem(
                            value: str,
                            child: Center(
                              child: Text(str,
                                  style: TextStyle(
                                    fontSize: adjustValue(context, 16.0),
                                    fontFamily: 'Cairo',
                                    color: AppColors.primary,
                                  )),
                            ),
                          ))
                      .toList();
                },
                onSelected: (_) {},
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: adjustValue(context, 10.0)),
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
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تقارير المستوى',
                    style: TextStyle(
                      fontSize: adjustWidthValue(context, 27.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ال${profile.ambition} ${profile.name}',
                    style: TextStyle(
                      fontSize: adjustWidthValue(context, 20.0),
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
}
