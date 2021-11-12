import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:najme/components/containers/main_container.dart';
import 'package:najme/components/buttons/right_end_button.dart';
import 'package:najme/constants/assets.dart';
import 'package:najme/constants/colors.dart';
class Registration_2 extends StatelessWidget {
  const Registration_2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var nameController=TextEditingController();
    return mainContainer(
              // a box in which a single widget can be scrolled.
              child:SingleChildScrollView(
                child: Column(
                  children: [

                      Image(
                        image: AssetImage(Assets.child),
                ),

                    const SizedBox(
                      height: 80.0,
                    ),
                    //Create name container
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        // Determine the direction " page ,text"
                        child: TextFormField(
                          textDirection: TextDirection.rtl,
                          obscureText: false,
                        controller: nameController,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'الاسم',
                         // prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color:AppColors.primaryLight,
                              )
                          ),
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
                    const Text("اكتب اسم الطفل !",
                      style: TextStyle(
                        fontFamily: "Cairo",
                          fontSize: 48.0,color: AppColors.primaryDark
                    ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),

                    rightEndButton(),
                  ],
                ),
              ),
    );
  }
}
