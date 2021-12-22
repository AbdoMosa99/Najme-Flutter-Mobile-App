import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/screen_specific/registration_address/address_button.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/screens/registeration_screens/registration_job.dart';
import 'package:najme/screens/registeration_screens/registration_level.dart';

import '../../utility.dart';

class RegistrationAddress extends StatefulWidget {
  const RegistrationAddress({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
              flex: 2,
                child: AddressButton(
                  width: adjustWidthValue(context, 262.0),
                  height: adjustHeightValue(context, 290.0),
                  text: "المحافظة",
                  title: "اختر محافظتك!          ",
                  fontSize: 28,
                  data: const [
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
                  ],
                ),
              ),

              Expanded(

                child: Text(
                  "اختر محافظتك!",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: adjustValue(context, 50.0),
                    fontFamily: 'Cairo',
                    color: AppColors.primaryDark,
                  ),
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
                Navigator.push(
                  context,
                  LeftRightPageRoute(const RegistrationLevel(), -1, 0),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        Navigator.push(
          context,
          LeftRightPageRoute(const RegistrationJob(), 1, 0),
        );
      },
    );
  }
}
