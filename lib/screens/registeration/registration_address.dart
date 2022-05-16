import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/screen_specific/registration_address/address_button.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/registeration/registration_job.dart';
import 'package:najme/screens/registeration/registration_level.dart';

import '../../components/general/error_message.dart';
import '../../components/screen_specific/registration/registration_topLayer.dart';
import '../../utility.dart';

class RegistrationAddress extends StatefulWidget {
  RegistrationAddress({
    Key? key,
    required this.profileData,
    required this.cities_list
  }) : super(key: key);

  Profile profileData;
  List cities_list;

  @override
  _RegistrationAddressState createState() => _RegistrationAddressState();
}

class _RegistrationAddressState extends State<RegistrationAddress> {
  bool valid = true;
  @override
  late int cityI;

  Widget build(BuildContext context) {
    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddressButton(
                  width: adjustWidthValue(context, 285.0),
                  height: adjustHeightValue(context, 315.0),
                  text: "المحافظة",
                  title: "اختر محافظتك!",
                  fontSize: 27,
                  data: widget.cities_list,
                  callback: (int index) {
                    cityI = index;
                  },
                ),
                if(!valid) ErrorMessage(
                  context: context,
                  message: "من فضلك اختر محافظتك",
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
          ),

          TopLayer(
            context: context,
            width: 0.88,
            onPressed: (){
              Navigator.pop(
                  context,false
              );
            },
          ),
        ],
      ),
      floatingActionButton: true,
      onFloatingActionButtonTap: () {
        if (widget.profileData.city != null) {
          widget.profileData.city = widget.cities_list[cityI];
          setState(() {
            valid = true;
          });
          Navigator.push(
            context,
            LeftRightPageRoute(RegistrationJob(profileData: widget.profileData), 1, 0),
          );
        }
        else{
          setState(() {
            valid = false;
          });
        }
      },
    );
  }
}
