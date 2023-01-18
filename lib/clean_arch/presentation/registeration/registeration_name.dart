import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najme/components/animation/two_d_direction.dart';
import 'package:najme/components/general/main_container.dart';
import 'package:najme/components/general/form_text_box.dart';
import 'package:najme/components/screen_specific/registration/registration_topLayer.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
import 'package:najme/database/models.dart';
import 'package:najme/screens/registeration/registeration_gender.dart';
import 'package:najme/utility.dart';


class RegistrationName extends StatelessWidget {
  RegistrationName({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  Profile profileData = Profile(
      id: 0,
      name: '',
      gender: '',
      birthdate:  DateTime.utc(2000, 1, 1),
      level: '',
      city: '',
      ambition: ''
  );

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    return MainContainer(
      paddingAll: 0.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(adjustValue(context, 20)),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          Assets.child,
                        height: adjustHeightValue(context, 170),
                      ),
                      SizedBox(
                        height: adjustHeightValue(context, 50),
                      ),
                      FormTextBox(
                        context: context,
                        text: "الأسم",
                        controllerKind: nameController,
                        type: TextInputType.name,
                        valid: (value){
                          if (value == "") {
                            return "من فضلك أدخل الأسم!";
                          }
                          return null;
                        }
                      ),
                      SizedBox(
                        height: adjustHeightValue(context, 50),
                      ),
                      Text(
                        "أسم الطفل",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: adjustValue(context, 40.0),
                          fontFamily: 'Cairo',
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          TopLayer(
            context: context,
            width: 0.44,
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
        if (_formKey.currentState!.validate()) {
          profileData.name = nameController.text;
          Navigator.push(
            context, 
            LeftRightPageRoute(
              RegistrationGender(profileData: profileData),
              1, 
              0,
            ),
          );
        }
      },
    );
  }
}
