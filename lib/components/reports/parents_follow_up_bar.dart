import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
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
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                        color: AppColors.secondaryLight, width: 1)),
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
                  //onTap: () {},
                ),
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
        );
}
