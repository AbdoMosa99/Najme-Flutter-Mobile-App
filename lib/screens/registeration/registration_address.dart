import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/screen_specific/registration_address/address_button.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration/registration_job.dart';
import 'package:najme/screens/registeration/registration_level.dart';

import '../../utility.dart';

class RegistrationAddress extends StatefulWidget {
  RegistrationAddress({
    Key? key,
    required this.registrationData,
  }) : super(key: key);

  Map<String, dynamic> registrationData;

  final cities = const [
    "القاهرة",
    "الجيزة",
    "الشرقية",
    "الدقهلية",
    "البحيرة",
    "المنيا",
    "القليوبية",
    "الإسكندرية",
    "الغربية",
    "سوهاج",
    "أسيوط",
    "المنوفية",
    "كفر الشيخ",
    "الفيوم",
    "قنا",
    "بني سويف",
    "أسوان",
    "دمياط",
    "الإسماعيلية",
    "الأقصر",
    "بور سعيد",
    "السويس",
    "مطروح",
    "شمال سيناء",
    "البحر الاحمر",
    "الوادي الجديد",
    "جنوب سيناء",
  ];

  @override
  _RegistrationAddressState createState() => _RegistrationAddressState();
}

class _RegistrationAddressState extends State<RegistrationAddress> {
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AddressButton(
                width: adjustWidthValue(context, 285.0),
                height: adjustHeightValue(context, 315.0),
                text: "المحافظة",
                title: "اختر محافظتك!",
                fontSize: 27,
                data: widget.cities,
                callback: (int index) {
                  widget.registrationData["city"] = index;
                },
              ),

              Text(
                "اختر محافظتك!",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: adjustValue(context, 45.0),
                  fontFamily: 'Cairo',
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                size: adjustValue(context, 24.0),
                color: AppColors.primary,
              ),
              onPressed: () {
                Navigator.pop(
                    context,false
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (widget.registrationData["city"] != null) {
          Navigator.push(
            context,
            LeftRightPageRoute(RegistrationJob(registrationData: widget.registrationData), 1, 0),
          );
        }
      },
    );
  }
}