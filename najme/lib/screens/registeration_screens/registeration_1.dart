import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
var emailController=TextEditingController();
class Registeration_1 extends StatelessWidget {
   const Registeration_1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Determine the direction " page ,text"
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // component for the screen background image
          body: mainContainer(
            child: Center(
              // a box in which a single widget can be scrolled.
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Center(
                      child: Image(
                        image: AssetImage(Assets.E),
                        height: 116,
                        width: 116,
                      ),
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    // create email container
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        obscureText: false,
                        controller: emailController,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'الايميل',
                          prefixIcon: const Icon(Icons.email_outlined) ,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: AppColors.primaryLight,
                              )),
                          fillColor: AppColors.surface,
                          filled: true,
                          labelStyle: const TextStyle(
                            fontFamily: 'assets/fonts/Cairo-Regular',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text("اكتب ايميل ولى الأمر!",
                    style: TextStyle(
                      fontFamily: "Cairo",fontSize: 36.0,color: AppColors.primaryDark
                    ),
                    ),
                    const SizedBox(
                        height: 50.0,
                    ),
                    const rightEndButton(),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}